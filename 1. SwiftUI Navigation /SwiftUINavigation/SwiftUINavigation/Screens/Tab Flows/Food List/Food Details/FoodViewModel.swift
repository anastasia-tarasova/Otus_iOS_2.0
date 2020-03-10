//
//  FoodViewModel.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var food: Food
    
    init(food: Food) {
        self.food = food
    }
}
