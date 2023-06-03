//
//  ByrdApp.swift
//  Byrd
//
//  Created by Fernando de Lucas da Silva Gomes on 28/05/23.
//

import SwiftUI

@main
struct ByrdApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

import Combine

struct ContentView: View {

    @ObservedObject private var viewModel = ViewModel(compass: .init())

    var body: some View {
        NavigationRoot(compass: $viewModel.compass) {
                content
            }
    }

    private var content: some View {
        Button {
            viewModel.onClick()
        } label: {
            Text("Show Modal!")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import Foundation
import Compass

final class ViewModel: ObservableObject {
    @Published var compass: NavigationCompass

    private var cancellable: Set<AnyCancellable> = []
    private let deepLinkResolver = DeepLinkResolver()

    init(compass: NavigationCompass) {
        self.compass = compass
        compass.linkPublisher(self.objectWillChange)
    }

    func onClick() {
        deepLinkResolver.resolve(compass: compass)
    }

}

import CompassInterface
final class DeepLinkResolver {

    func resolve(
        compass: NavigationCompassProtocol
    ) {
        let view = AnyView(Text("some"))
        compass.navigate(for: HashableView(view))
    }

}
