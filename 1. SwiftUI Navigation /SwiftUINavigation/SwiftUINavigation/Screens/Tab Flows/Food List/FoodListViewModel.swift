//
//  FoodListViewModel.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine

final class FoodListViewModel: ObservableObject {
    
    let foodStorage = FoodStorage.shared
    
    @Published private(set) var filterButtonName = "Switch Faves"
    
    @Published private(set) var foods = [Food]()
    
    @Published private(set) var isLoading = false
    
    /// Id of a food we need to navigate to.
    var targetFoodId: UUID?
    
    init() {
        loadFromServer()
    }
    
    func loadFromServer() {
        self.foods.removeAll()
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else {
                return
            }
            print("FoodListViewModel - food is loaded")
            self.foods = self.foodStorage.allFood
            self.isLoading = false
        }
    }
}
