import ProjectDescription
import ProjectDescriptionHelpers

let target = Target(
    name: "LandData",
    platform: .iOS,
    product: .framework,
    bundleId: "com.fernanddolucas.LandData",
    sources: ["Sources/**"],
    dependencies: [
        .dependency(.landDataInterface)
    ]
)

let project = Project(
    name: "LandData",
    organizationName: "com.fernanddolucas.LandData",
    packages: [],
    targets: [
        target,
        target.buildTest()
    ]
)
