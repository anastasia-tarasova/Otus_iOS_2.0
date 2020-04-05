//
//  RootTabView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct RootTabView: View {
    
    @State var selection: RootTab = .characters
    
    var body: some View {
        TabView(selection: $selection) {
            CharacterPagedListView()
                .tabItem {
                    Image(systemName: (selection == .characters ? "1.circle.fill" : "1.circle"))
                    Text("Characters")
            }.tag(RootTab.characters)
            CustomNavigationView()
                .tabItem {
                    Image(systemName: (selection == .customNavStack ? "2.circle.fill" : "2.circle"))
                    Text("Navigation")
            }.tag(RootTab.customNavStack)
        }
    }
}

enum RootTab: Int {
    case characters
    case customNavStack
}

// MARK: - Previews
struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
