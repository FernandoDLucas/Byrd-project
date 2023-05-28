import SwiftUI

public final class HashableView: AnyHashableView {
    public var view: AnyView?

    public init(_ view: AnyView?) {
        self.view = view
    }
}
