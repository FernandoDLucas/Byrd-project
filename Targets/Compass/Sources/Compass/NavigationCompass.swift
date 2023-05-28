//
//  Compass.swift
//  Navigation
//
//  Created by Fernando de Lucas da Silva Gomes on 28/05/23.
//  Copyright © 2023 com.fernanddolucas.navigation. All rights reserved.
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

public final class NavigationCompass: ObservableObject, NavigationCompassProtocol {

    @Published var presentFullScreen: Bool = false
    @Published var showModal: Bool = false
    @Published var navigationPath = NavigationPath()
    private (set) var modalView: AnyView?

    public init() {}

    public func navigate(for view: any Hashable) {
        navigationPath.append(view)
    }

    public func present(
        for view: AnyView,
        basedOn navigationType: NavigationModalType
    ) {
        modalView = view
        switch navigationType {
        case .modal:
            showModal = true
        case .fullScreenModal:
            presentFullScreen = true
        }
    }

}
