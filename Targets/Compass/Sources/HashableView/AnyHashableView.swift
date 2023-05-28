import Foundation
import SwiftUI

protocol AnyHashableView: Hashable, Equatable, Identifiable {
    var view: AnyView? {get set}
}

extension AnyHashableView {
    var identifier: String {
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
