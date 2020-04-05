//
//  NavControllerView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 16.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

/**
 Custom version of NavigationView
 */
struct NavControllerView<Content>: View where Content: View {

    @ObservedObject private var viewModel: NavControllerViewModel

    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)

    init(transition: NavTransition,
         easing: Animation = .easeOut(duration: 0.33),
         @ViewBuilder content: @escaping () -> Content)
    {
        self.viewModel = NavControllerViewModel(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let trans):
            self.transitions = (trans, trans)
        case .none:
            self.transitions = (.identity, .identity)
        }
    }

    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            }
        }
    }
}

// MARK: - Types
enum NavTransition {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}


// MARK: - Logic

/// Model Node of Screen in naigation stack.
private struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

/**
 Manages navigation logic.
 */
final class NavControllerViewModel: ObservableObject {
    
    private let easing: Animation
    
    var navigationType = NavType.push
    
    @Published fileprivate var currentScreen: Screen?
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    // Init
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    // API
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.popToPrevious()
            }
        }
    }
    
    // Nested Stack Model
    
    private struct ScreenStack {
        
        private var screens = [Screen]()
        
        func top() -> Screen? {
            screens.last
        }
        
        mutating func push(_ s:Screen) {
            screens.append(s)
        }
        
        mutating func popToPrevious() {
            _ = screens.popLast()
        }
        
        mutating func popToRoot() {
            screens.removeAll()
        }
    }
}

