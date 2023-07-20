import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "LandDomainInterface",
    organizationName: "com.fernanddolucas.LandDomainInterface",
    packages: [],
    targets: [Target(
        name: "LandDomainInterface",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.LandDomainInterface",
        sources: ["Sources/**"],
        dependencies: [
            .dependency(.landDataInterface)
        ]
    )]
)
