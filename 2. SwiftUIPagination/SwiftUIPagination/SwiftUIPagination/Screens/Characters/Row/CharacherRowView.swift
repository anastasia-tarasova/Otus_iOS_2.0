//
//  CharacherRowView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct CharacterRowView: View {

    @ObservedObject var viewModel: CharacterRowViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(viewModel.character.name)
            VStack(alignment: .leading, spacing: 2) {
                Text("id: \(viewModel.character.id)")
                self.livingStatus
                self.origin
            }
        }
    }
    
    var origin: some View {
        Text("Origin: \(viewModel.character.origin?.name ?? "Unknown")")
    }
    
    var livingStatus: some View {
        Text("Status: \(viewModel.character.status.capitalized)")
    }
}

// MARK: - Preview

struct CharacherRowView_Previews: PreviewProvider {
    static var previews: some View {
        let character = CharacterModel(
            id: 1,
            name: "Rick Sanchez",
            status: "alive",
            species: nil,
            type: nil,
            gender: "male",
            origin: .init(name: "Earth", url: nil),
            location: nil,
            image: nil,
            episode: nil,
            url: nil,
            created: nil
        )
        
        let viewModel = CharacterRowViewModel(character: character)
        let view = CharacterRowView(viewModel: viewModel)
        
        return view
    }
}
