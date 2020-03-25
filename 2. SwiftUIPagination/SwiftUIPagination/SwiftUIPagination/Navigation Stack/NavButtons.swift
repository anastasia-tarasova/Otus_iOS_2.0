//
//  NavButton.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Push
struct NavPushButton<ContentView, Destination>: View where ContentView: View, Destination: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: Destination
    private let contentView: ContentView

    init(destination: Destination, @ViewBuilder contentView: @escaping () -> ContentView) {
        self.destination = destination
        self.contentView = contentView()
    }
    
    var body: some View {
        contentView.onTapGesture {
            self.push()
        }
    }
    
    private func push() {
        self.viewModel.push(self.destination)
    }
}

// MARK: - Pop
struct NavPopButton<ContentView>: View where ContentView: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: PopDestination
    private let contentView: ContentView
    
    init(destination: PopDestination, @ViewBuilder contentView: @escaping () -> ContentView) {
        self.destination = destination
        self.contentView = contentView()
    }
    
    var body: some View {
        contentView.onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        viewModel.pop(to: destination)
    }
}
