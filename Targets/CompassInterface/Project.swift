import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CompassInterface",
    organizationName: "com.fernanddolucas.CompassInterface",
    packages: [],
    targets: [Target(
        name: "CompassInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.CompassInterface",
        sources: ["Sources/**"],
        dependencies: []
    )]
)
