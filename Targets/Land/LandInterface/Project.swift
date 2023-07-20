import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "LandInterface",
    organizationName: "com.fernanddolucas.LandInterface",
    packages: [],
    targets: [Target(
        name: "LandInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.LandInterface",
        sources: ["Sources/**"],
        dependencies: []
    )]
)
