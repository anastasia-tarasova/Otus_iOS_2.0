//
//  FoodListView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct FoodListView: View {    
    @EnvironmentObject var appRouter: AppRouter
    @EnvironmentObject var viewModel: FoodListViewModel
    
    @State var favedShowed = false
    
    @State var navigationSelection : Int? = nil
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    loadingView
                } else {
                    listView
                }
            }
            .navigationBarTitle("Foods")
        } // NavigationView
        .padding(.top, ScreenPaddingCalculator.shared.topPadding)
        // Force iPhone-like style as a workaround for broken splitView in iPad portrait mode.
        .navigationViewStyle(StackNavigationViewStyle())
        .onReceive( appRouter.$foodDetailsIdNavigationRequired.combineLatest(viewModel.$isLoading)) { foodId, isLoading in
            print("onReceive: ", isLoading, foodId ?? "nil")
            /// need to wait for both foodId and loadingStatus
            self.viewModel.targetFoodId = foodId
            self.navigateToFoodDetails(foodId: foodId)
        }
        .onAppear() {
            print("onAppear: ")
            // for the case when foodId was emitted earlier than view is ready or food dala is loaded.
            if let id = self.viewModel.targetFoodId {
                self.navigationSelection = nil
                /// Workaround for the case when data was loaded whihe view was not when foodId was received.
                /// NavigationLink doesn't work when content is not visible.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.navigateToFoodDetails(foodId: id)
                }
            }
        }
        .onDisappear() {
            self.navigationSelection = nil
            self.viewModel.targetFoodId = nil
        }
    }
    
    func navigateToFoodDetails(foodId: UUID?) {
        guard
            let id = self.viewModel.targetFoodId,
            let index = self.filteredFoods.firstIndex(where: { $0.id == id }) else {
                self.navigationSelection = nil
                return
        }
        
        self.navigationSelection = index
    }
    
    var loadingView: some View {
        ActivityIndicatorView()
    }
    
    var listView: some View {
        List() {
            FilterView(favedShowed: $favedShowed, filterButtonName: viewModel.filterButtonName)
            ForEach(Array(filteredFoods.enumerated()), id: \.element.id) { pair in
                
                NavigationLink(
                    destination: LazyView<FoodView>(FoodView(viewModel: FoodViewModel(food: pair.element))),
                               tag: pair.offset,
                               selection: self.$navigationSelection) {
                                Text(pair.element.name)
                }
            }
        }
    }
    
    var filteredFoods: [Food] {
        switch self.favedShowed {
        case false:
            return viewModel.foods
        case true:
            return viewModel.foods.filter { $0.isFav == true }
        }
    }
}

struct FilterView: View {
    
    @Binding var favedShowed: Bool
    @State var filterButtonName: String = ""
    
    var body: some View {
        Toggle(isOn: $favedShowed) {
            Text($filterButtonName.wrappedValue)
        }
    }
}

// MARK: - Previews
#if DEBUG
struct FoodListView_Previews: PreviewProvider {
    
    static var previews: some View {
        FoodListView()
            .environmentObject(FoodListViewModel())
            .environmentObject(AppRouter())
    }
}
#endif
