//
//  TriggerButtonViewModel.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

class TriggerButtonViewModel: ObservableObject {
    let foodStorage = FoodStorage.shared
    
    var apple: Food? {
        return foodStorage.allFood.first { $0.name == "Apple" }
    }
}
