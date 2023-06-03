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
        dependencies: TargetDependency.with(
            [
            Dependency.self,
            ExternalDependency.self,
            SystemDependency.self
            ]
        )
    )]
)
