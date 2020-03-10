//
//  AppRouter.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

final class AppRouter: ObservableObject {
    // private setter because no other object should be able to modify this
    private (set) var previousSelectedTab: RootTab?
    
    /// Currently selected tab on RootTabView
    @Published var selectedRootTab: RootTab = .button {
        didSet {
            previousSelectedTab = oldValue
        }
    }
    
    /// Publishes a Food id for which navigation to Food Details is required
    @Published private (set) var foodDetailsIdNavigationRequired: UUID?
    
    func navigateToFoodDetails(id: UUID) {
        print("navigateToFoodDetails id: \(id)")
        selectedRootTab = .list
        foodDetailsIdNavigationRequired = id
    }
}
