import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Land",
    organizationName: "com.fernanddolucas.Land",
    packages: [],
    targets: [Target(
        name: "Land",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.Land",
        sources: ["Sources/**"],
        dependencies: [
        ]
    )]
)
