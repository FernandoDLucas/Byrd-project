import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Compass",
    organizationName: "com.fernanddolucas.Compass",
    packages: [],
    targets: [Target(
        name: "Compass",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.Compass",
        sources: ["Sources/**"],
        dependencies: [
            .project(
                target: "CompassInterface",
                path: .relativeToRoot("Targets/CompassInterface")
            )
        ]
    )]
)
