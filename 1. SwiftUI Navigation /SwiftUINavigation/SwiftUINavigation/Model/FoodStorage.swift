//
//  FoodStorage.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

class FoodStorage {
    
    static let shared = FoodStorage()
    
    private (set) var allFood: [Food] = {
        [
            Food(name: "Strawberry", isFav: true),
            Food(name: "Cheese", isFav: false),
            Food(name: "Apple", isFav: true),
            Food(name: "Tomato", isFav: false)
        ]
    }()
    
    func fetchApple() -> Food? {
        return self.allFood.first { $0.name == "Apple" }
    }
    
    private init() {}
}
