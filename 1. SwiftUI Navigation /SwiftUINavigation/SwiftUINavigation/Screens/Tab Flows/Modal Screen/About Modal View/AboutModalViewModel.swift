//
//  AboutModalViewModel.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import UIKit
import Combine

class AboutModalViewModel: ObservableObject {
    @Published var appDescription: String = "Test app for multiple SwiftUI navigation cases."
    
    var appVersion: String {
        let version = UIApplication.shared.appVersion ?? ""
        let buildVersion = UIApplication.shared.buildVersion ?? ""
        
        return "\(version) (\(buildVersion))".trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
