import CompassInterface
import SwiftUI

public final class HashableView: AnyHashableView {
    public var content: AnyView?

    public init(_ content: AnyView?) {
        self.content = content
    }
}
