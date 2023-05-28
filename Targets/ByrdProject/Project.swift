import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let project = Project(
    name: "Byrd",
    organizationName: "com.fernanddolucas.Byrd",
    packages: [],
    targets: [Target(
        name: "Byrd",
        platform: .iOS,
        product: .app,
        bundleId: "com.fernanddolucas.Byrd",
        sources: ["Sources/**"],
        dependencies: [
            .project(
                target: "CompassInterface",
                path: .relativeToRoot("Targets/CompassInterface")
            ),
            .project(
                target: "Compass",
                path: .relativeToRoot("Targets/Compass")
            ),
            .sdk(name: "UIKit", type: .framework),
            .sdk(name: "SwiftUI", type: .framework),
            .sdk(name: "Foundation", type: .framework),
            .sdk(name: "CoreGraphics", type: .framework),
            .sdk(name: "z", type: .library),
            .sdk(name: "c++", type: .library)
        ]
    )]
)
