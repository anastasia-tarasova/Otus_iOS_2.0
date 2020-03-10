//
//  TriggerButtonView.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 08.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import SwiftUI

struct TriggerButtonView: View {
    @EnvironmentObject var viewModel: TriggerButtonViewModel
    @EnvironmentObject var appRouter: AppRouter
    
    @State var appleMissingAlertShown = false
    
    var body: some View {
        Button(action: {
            guard let apple = self.viewModel.apple else {
                self.showAppleMissingAlert()
                return
            }
            self.appRouter.navigateToFoodDetails(id: apple.id) }) {
            Text("Go to Apple details")
        }
        .alert(isPresented: $appleMissingAlertShown) {
            Alert(title: Text("Food Missing"), message: Text("Apple food is missing in storage."), dismissButton: .default(Text("Ok")))
        }
    }
    
    func showAppleMissingAlert() {
        appleMissingAlertShown = true
    }
}
