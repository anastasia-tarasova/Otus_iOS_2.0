//
//  Food.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

struct Food: Identifiable, CustomStringConvertible {
    let id = UUID()
    let name: String
    let isFav: Bool
    
    var description: String {
        return """
        id: \(id)
        name: \(name)
        favorite: \(isFav)
        """
    }
}
