//
//  AboutView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct AboutView: View {
    
    @EnvironmentObject var aboutModalViewModel: AboutModalViewModel
    
    @State var aboutShowed: Bool = false
    
    var body: some View {
        VStack {
            Text("About App")
                .simultaneousGesture(TapGesture().onEnded {
                    self.aboutShowed.toggle()
                })
        }
        .sheet(isPresented: $aboutShowed, onDismiss: { print("Modal Closed") }) {
            AboutModalView()
                .environmentObject(self.aboutModalViewModel)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
