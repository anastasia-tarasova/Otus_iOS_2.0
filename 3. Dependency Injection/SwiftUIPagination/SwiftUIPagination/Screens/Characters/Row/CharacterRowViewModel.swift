//
//  CharacterRowViewModel.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation

final class CharacterRowViewModel: ObservableObject {
    @Published private(set) var character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
    }
}
