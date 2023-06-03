//
//  NavigationCompassModifier.swift
//  TestByrd
//
//  Created by Fernando de Lucas da Silva Gomes on 26/05/23.
//

import SwiftUI

public struct NavigationRoot<Root>: View where Root: View{

    @Binding private var compass: NavigationCompass
    private let root: Root

    @MainActor public init(
        compass: Binding<NavigationCompass>,
        @ViewBuilder root: () -> Root
    ) {
        self._compass = compass
        self.root = root()
    }


    public var body: some View {
        NavigationStack(path: $compass.navigationPath) {
            root
                .navigationDestination(for: HashableView.self) { view in
                    view.content
                }
        }
        .sheet(isPresented: $compass.showModal) {
            compass.modalView
        }
        .fullScreenCover(isPresented: $compass.presentFullScreen) {
            compass.modalView
        }
    }
}
