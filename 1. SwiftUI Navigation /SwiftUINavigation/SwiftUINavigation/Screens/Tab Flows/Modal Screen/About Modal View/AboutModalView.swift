//
//  AboutModalView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct AboutModalView: View {
    
    @EnvironmentObject var viewModel: AboutModalViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Spacer()
            Text($viewModel.appDescription.wrappedValue)
            Spacer()
            Spacer()
            Text("App version: \(viewModel.appVersion)")
                .multilineTextAlignment(.center)
            EmptyView()
                .frame(width: nil, height: 20, alignment: .bottom)
        }
    }
}

// MARK: - Previews
struct AboutModalView_Previews: PreviewProvider {
    static var previews: some View {
        AboutModalView()
            .environmentObject(AboutModalViewModel())
    }
}
