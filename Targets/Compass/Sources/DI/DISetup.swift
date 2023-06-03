//
//  DISetup.swift
//  Compass
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//  Copyright © 2023 com.fernanddolucas.Compass. All rights reserved.
//

import CompassInterface
import DI

public final class DISetup {
    
    public init() {}

    public func setup() {
        DIContainer.appContainer.register(NavigationCompassProtocol.self) { _ in
            NavigationCompass()
        }
    }
}
