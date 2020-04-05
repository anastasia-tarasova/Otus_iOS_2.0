//
//  CustomNavigationView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        NavigationView {
            NavControllerView(transition: .custom(.moveAndFade)) {
                FirstView()
            }
            .navigationBarTitle("Custom Navigation")
        }
    }
}

//MARK: - Previews

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
