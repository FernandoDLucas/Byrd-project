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
        let url = Bundle.main.url(forResource: "Land", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        
        let decoder = JSONDecoder()
        decoder.userInfo[.polymorphicTypes] = [
            Image.self,
        ]

        do {
            let comp = try decoder.decode(
                LandComponent.self,
                from: data!
            )
            print(DataWrapper().execute(
                from: comp.landItem,
                get: Byrd.Image.self)
            )
        } catch {
            print(error)
        }
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
