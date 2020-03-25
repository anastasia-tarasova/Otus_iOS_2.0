//
//  FirstView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct FirstView: View {
    
    var body: some View {
        VStack {
            Spacer().frame(width: nil, height: 20, alignment: .top)
            Text("First View")
            VStack {
                NavPushButton(destination: SecondView()) {
                    Text("Open Second Screen")
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
        .background(Color.yellow)
    }
}

//MARK: - Previews

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
