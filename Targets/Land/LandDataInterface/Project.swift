import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "LandDataInterface",
    organizationName: "com.fernanddolucas.LandDataInterface",
    packages: [],
    targets: [Target(
        name: "LandDataInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.LandDataInterface",
        sources: ["Sources/**"],
        dependencies: []
    )]
)
