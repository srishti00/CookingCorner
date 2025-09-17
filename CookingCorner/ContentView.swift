//
//  ContentView.swift
//  CookingCorner
//
//  Created by srisshar on 28/06/24.
//

import SwiftUI

struct ContentView: View {
  
    @ObservedObject var viewModel = MealCategoriesViewModel()
    
//    var body: some View {
//        NavigationView {
//            List(viewModel.mealCategories, id: \.strCategory) { category in
//                Text(category.strCategory)
//            }
//            .navigationTitle("Meal Categories")
//            .onAppear {
//                viewModel.fetchMealCategories()
//            }
//        }
//    }
    var body: some View {
        NavigationStack {
            OnboardingScreen()
        }
    }

}

#Preview {
    ContentView()
}

