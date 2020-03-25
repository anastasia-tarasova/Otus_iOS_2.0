//
//  ScreenPaddingCalculator.swift
//  SwiftUINavigation
//
//  Created by Anastasia Tarasova on 10.03.2020.
//  Copyright © 2020 Anastasia Tarasova. All rights reserved.
//

import Foundation
import DeviceKit
import UIKit

class ScreenPaddingCalculator {
    
    static let shared = ScreenPaddingCalculator()
    
    var topPadding: CGFloat{
        let device = Device.current
        if device.isOneOf(Device.allDevicesWithSensorHousing) || device.isOneOf(Device.allSimulatorDevicesWithSensorHousing) {
            if #available(iOS 13.4, *) {
                return 0
            }
            else {
                return -44
            }
        }
        else {
            return 0
        }
    }
}
