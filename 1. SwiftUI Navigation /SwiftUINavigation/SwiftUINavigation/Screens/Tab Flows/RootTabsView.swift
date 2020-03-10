//
//  RootTabsView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct RootTabsView: View {
    
    @EnvironmentObject var appRouter: AppRouter
    
    @State var selection: RootTab = .button
    
    var body: some View {
        TabView(selection: $selection) {
            TriggerButtonView()
                .tabItem {
                    Image(systemName: (selection == .button ? "1.circle.fill" : "1.circle"))
                    Text("Button")
            }.tag(RootTab.button)
            FoodListView()
                .tabItem {
                    Image(systemName: (selection == .list ? "2.circle.fill" : "2.circle"))
                    Text("List")
            }.tag(RootTab.list)
            AboutView()
                .tabItem {
                    Image(systemName: (selection == .list ? "3.circle.fill" : "3.circle"))
                    Text("Modal")
            }.tag(RootTab.modal)
        }// TabView
        .onReceive(appRouter.$selectedRootTab) { selectedTab in
            self.selection = selectedTab
        }
    }
}

enum RootTab: Int {
    case button
    case list
    case modal
}

// MARK: - Previews
struct RootTabsView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabsView()
    }
}
