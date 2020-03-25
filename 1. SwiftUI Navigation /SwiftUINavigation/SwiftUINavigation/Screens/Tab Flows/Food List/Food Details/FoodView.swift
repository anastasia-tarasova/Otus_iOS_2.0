//
//  FoodView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct FoodView: View {
   @ObservedObject var viewModel: FoodViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: viewModel.food.isFav ? "suit.heart.fill" : "suit.heart")
                .foregroundColor(.red)
                .font(.largeTitle)
                .padding(.bottom, 20)
            Text(viewModel.food.name)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


// MARK: - Previews

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: FoodViewModel(food: .init(name: "Apple", isFav: true)))
    }
}
