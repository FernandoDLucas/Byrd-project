import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "DI",
    organizationName: "com.fernanddolucas.DI",
    packages: [],
    targets: [Target(
        name: "DI",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.DI",
        sources: ["Sources/**"],
        dependencies: [
            .external(.swinject)
        ]
    )]
)
