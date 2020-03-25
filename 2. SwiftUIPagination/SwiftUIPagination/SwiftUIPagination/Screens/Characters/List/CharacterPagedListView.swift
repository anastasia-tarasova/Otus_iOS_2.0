//
//  PagedListView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 21.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct CharacterPagedListView: View
{
    @EnvironmentObject var viewModel: CharacterPagedListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                self.segmentedControl
                self.itemsList
            }
            .navigationBarTitle("Characters")
            .onAppear() {
                self.viewModel.loadNextPage()
            }
        }
    }
    
    var segmentedControl: some View {
        Picker(selection: $viewModel.requestOption, label: Text("")) {
            Text("Alive").tag(CharacterRequestOption.characterAlive)
            Text("Dead").tag(CharacterRequestOption.characterDead)
        }.pickerStyle(SegmentedPickerStyle())
    }
    
    var itemsList: some View {
        List {
            ForEach(Array(self.viewModel.items.enumerated()), id: \.element.id) { pair in
                
                VStack(alignment: .leading) {
                    Group {
                        CharacterRowView(viewModel: .init(character: pair.element))
                    }.onAppear() {
                        if self.viewModel.items.isLast(pair.element) {
                            self.viewModel.loadNextPage()
                        }
                    }
                    if self.viewModel.isPageLoading && self.viewModel.items.isLast(pair.element) {
                        Divider()
                        Text("Loading...")
                            .padding(.vertical)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct CharacterPagedListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterPagedListViewModel()
        
        return CharacterPagedListView()
            .environmentObject(viewModel)
    }
}
