//
//  LazyView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

public struct LazyView<Content: View>: View {
    private let build: () -> Content
    
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    public var body: Content {
        build()
    }
}
