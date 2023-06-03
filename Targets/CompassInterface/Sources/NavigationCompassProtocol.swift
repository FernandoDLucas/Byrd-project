//
//  NavigationCompassProtocol.swift
//  CompassInterface
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//  Copyright © 2023 com.fernanddolucas.CompassInterface. All rights reserved.
//

import Foundation
import SwiftUI

public protocol NavigationCompassProtocol {
    func navigate(for view: any Hashable)
    func present(
        for view: AnyView,
        basedOn navigationType: NavigationModalType
    )
}
