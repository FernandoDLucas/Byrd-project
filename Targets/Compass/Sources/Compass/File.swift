//import SwiftUI
//import Combine
//import Navigation
//
//struct ContentView: View {
//
//    @ObservedObject private var viewModel = ViewModel(compass: .init())
//
//    var body: some View {
//        NavigationRoot(compass: $viewModel.compass) {
//                content
//            }
//    }
//
//    private var content: some View {
//        Button {
//            viewModel.onClick()
//        } label: {
//            Text("Show Modal!")
//        }
//    }
//
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//import Foundation
//
//final class ViewModel: ObservableObject {
//    @Published var compass: NavigationCompass
//
//    private var cancellable: Set<AnyCancellable> = []
//    private let deepLinkResolver = DeepLinkResolver()
//
//    init(compass: NavigationCompass) {
//        self.compass = compass
//        compass
//            .objectWillChange
//            .sink{ [weak self] _ in
//                self?.objectWillChange.send()
//            }
//            .store(in: &cancellable)
//    }
//
//    func onClick() {
//        deepLinkResolver.resolve(compass: compass)
//    }
//
//}
//
//final class DeepLinkResolver {
//
//    func resolve(
//        compass: NavigationCompassProtocol
//    ) {
//        let view = AnyView(Text("some"))
//        compass.navigate(for: HashableView(view))
//    }
//
//}
