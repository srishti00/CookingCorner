//
//  RecipeDataManager.swift
//  CookingCorner
//
//  Created by srisshar on 02/07/24.
//

import SwiftUI
import Combine

// Model to match the response structure
struct MealCategory: Codable {
    let strCategory: String
}

struct MealCategoriesResponse: Codable {
    let meals: [MealCategory]
}

// ViewModel to handle the API request and data
class MealCategoriesViewModel: ObservableObject {
    
    @Published var mealCategories: [MealCategory] = []
    
    private var cancellable: AnyCancellable?
    
    func fetchMealCategories() {
        let headers = [
            "x-rapidapi-key": "9f63a4ad11mshd55db33b1df7f2ap1426a4jsncf55a341c658",
            "x-rapidapi-host": "themealdb.p.rapidapi.com"
        ]

        guard let url = URL(string: "https://themealdb.p.rapidapi.com/list.php?c=list") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: MealCategoriesResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request successful")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.mealCategories = response.meals
            })
    }
}

//// SwiftUI View to display the meal categories
//struct ContentView: View {
//    @ObservedObject var viewModel = MealCategoriesViewModel()
//    
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
//}

//@main
//struct CookingCornerApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
