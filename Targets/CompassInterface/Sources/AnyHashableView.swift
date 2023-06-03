//
//  NavigationCompassProtocol.swift
//  CompassInterface
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//  Copyright © 2023 com.fernanddolucas.CompassInterface. All rights reserved.
//

import Foundation
import SwiftUI

public protocol AnyHashableView: Hashable, Equatable, Identifiable {
    var content: AnyView? { get }
}

extension AnyHashableView {
    public var identifier: String {
        return UUID().uuidString
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }

    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        return lhs.id == rhs.id
    }

}
