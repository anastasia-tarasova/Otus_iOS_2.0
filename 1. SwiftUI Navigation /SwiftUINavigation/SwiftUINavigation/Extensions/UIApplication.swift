//
//  UIApplication.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 09.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
