//
//  SecondView.swift
//  SwiftUIPagination
//
//  Created by Anastasia Tarasova on 25.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct SecondView: View {
    
    var body: some View {
        VStack {
            Spacer().frame(width: nil, height: 20, alignment: .top)
            Text("Second View")
            VStack {
                NavPopButton(destination: .previous) {
                    Text("Pop to first view")
                }
                Spacer().frame(width: nil, height: 20, alignment: .center)
                NavPushButton(destination: ThirdView()) {
                    Text("Push third view")
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
        }
        .background(Color.orange)
    }
}

//MARK: - Previews

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
