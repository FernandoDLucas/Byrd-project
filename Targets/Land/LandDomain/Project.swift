import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "LandDomain",
    organizationName: "com.fernanddolucas.LandDomain",
    packages: [],
    targets: [Target(
        name: "LandDomain",
        platform: .iOS,
        product: .framework,
        bundleId: "com.fernanddolucas.LandDomain",
        sources: ["Sources/**"],
        dependencies: [
            .dependency(.landDataInterface),
            .dependency(.landDomainInterface)
        ]
    )
]
)
