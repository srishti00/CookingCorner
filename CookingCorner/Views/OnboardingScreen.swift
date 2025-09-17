//
//  OnboardingScreen.swift
//  CookingCorner
//
//  Created by srisshar on 28/06/24.
//

import Foundation
import SwiftUI

struct OnboardingScreen: View {
    
    //Intros Data
    @State var intros: [Intro] = [
        Intro(title: "Welcome to Cooking Corner", subtitle: "Welcome to Cooking Corner", description: "Dive into a world of flavor and creativity. Cooking Corner is here to inspire your inner chef with an endless array of delectable recipes.", pic: "intro5", color: LinearGradient(colors: [Color.cyan, Color.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)),
        Intro(title: "Simple, Tasty, and Fun", subtitle: "Simple, Tasty, and Fun", description: "Explore a variety of easy-to-follow recipes designed to make cooking enjoyable and accessible for everyone, from novices to experts", pic: "intro1", color: LinearGradient(colors: [Color.indigo, Color.cyan], startPoint: .topLeading, endPoint: .bottomTrailing)),
        Intro(title: "Craft Your Recipe Book", subtitle: "Personal Recipe Collection", description: "Keep your favorite recipes close at hand. Save them to your personal cookbook and enjoy them whenever you like, right at your fingertips.", pic: "intro3", color: LinearGradient(colors: [Color.cyan, Color.indigo], startPoint: .topLeading, endPoint: .bottomTrailing)),
        Intro(title: "Get Started", subtitle: "Ready to Cook?", description: "Join a community of food enthusiasts and start your culinary journey today. Tap the Get Started button to explore thousands of recipes waiting for you.", pic: "intro4", color: LinearGradient(colors: [Color.indigo, Color.cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
    ]
    
    //Gesture Properties
    @GestureState var isDragging: Bool = false
    
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int = 0
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ForEach(intros.indices.reversed(), id: \.self) { index in
                    IntroView(intro: intros[index])
                        .clipShape(LiquidShape(offset: intros[index].offset, curvePoint: currentIndex == intros.count - 3 ? 0 : fakeIndex == index ? 50 : 0))
                        .padding(.trailing, currentIndex == intros.count - 3 ? 0 : fakeIndex == index ? 15 : 0)
                        .ignoresSafeArea()
                }
                HStack(spacing: 0) {
                    ///Indicator
                    ForEach(0..<intros.count - 2, id: \.self) { index in
                        Circle()
                            .fill(currentIndex == index ? .white : .gray)
                            .frame(width: 8, height: 8)
                            .scaleEffect(currentIndex == index ? 1 : 0.85)
                            .opacity(currentIndex == index ? 1 : 0.25)
                    }
                    Spacer()
                    
                    Button {
                        print("clicked")
                        if currentIndex == intros.count - 3 {
                            isLoggedIn.toggle()
                        } else {
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                                
                                // Move current screen off-screen
                                intros[fakeIndex].offset.width = -getRect().height * 1.5
                                fakeIndex += 1
                                
                                // Update currentIndex
                                if currentIndex == intros.count - 3 {
                                    currentIndex = 0
                                } else {
                                    currentIndex += 1
                                }
                                
                                // Reset if at end
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                    if fakeIndex == (intros.count - 2) {
                                        for index in 0..<intros.count - 2 {
                                            intros[index].offset = .zero
                                        }
                                        fakeIndex = 0
                                    }
                                }
                            }
                        }
                    } label: {
                        Text(currentIndex == intros.count - 3 ? "Get Started" : "Next")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        LaunchView()
                    }
                    
                    
                }
                .padding()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
            }
            
            //Arrow with Drag Gesture
            .overlay(
                Image(systemName: currentIndex == intros.count - 3 ? "" : "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.white)
                    .contentShape(Rectangle())
                
                    .gesture(
                        // Drag Gesture
                        DragGesture()
                            .updating($isDragging, body: {
                                value, out, _ in
                                out = true
                            })
                            .onChanged({
                                value in
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                                    intros[fakeIndex].offset = isDragging ? value.translation : .zero
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.spring()) {
                                    if -intros[fakeIndex].offset.width > getRect().width / 2 {
                                        intros[fakeIndex].offset.width = -getRect().height * 1.5
                                        fakeIndex += 1
                                        if currentIndex == intros.count - 3 {
                                            currentIndex = 0
                                        }
                                        else {
                                            currentIndex += 1
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            if fakeIndex == (intros.count - 2) {
                                                for index in 0..<intros.count - 2 {
                                                    intros[index].offset = .zero
                                                }
                                                fakeIndex = 0
                                            }
                                        }
                                    }
                                    else {
                                        intros[fakeIndex].offset = .zero
                                    }
                                }
                                
                            })
                    )
                    .ignoresSafeArea()
                    .offset(y: (80 + 25) - getSafeArea().top)
                    .opacity(isDragging ? 0 : 1)
                    .animation(.linear, value: isDragging),
                alignment: .topTrailing
            )
            .onAppear {
                guard let first = intros.first else { return }
                guard var last = intros.last else { return }
                last.offset.width = -getRect().height * 1.5
                
                intros.append(first)
                intros.insert(last, at: 0)
                fakeIndex = 1
            }
        }
    }
    
    //IntroViewBuilder
    @ViewBuilder
    func IntroView(intro: Intro) -> some View {
        ZStack {
            Image(intro.pic)
                .resizable()
                .ignoresSafeArea()
            Rectangle()
                .foregroundStyle(.black.opacity(0.4))
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Text(intro.title)
                    .font(.system(size: 50, weight: .bold))
                    .hidden()
                
                Text(intro.subtitle)
                    .font(.system(size: 50, weight: .bold))
                
                Text(intro.description)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .frame(width: getRect().width - 100)
                    .lineSpacing(0)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding([.trailing, .top])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            intro.color
        )
    }
}


#Preview {
    ContentView()
}
