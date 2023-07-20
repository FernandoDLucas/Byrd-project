//
//  Target+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 12/06/23.
//

import ProjectDescription

extension Target {
    public func buildTest(
        dependencies: [TargetDependency] = []
    ) -> Target {
        return .init(
            name: "\(self.name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(self.bundleId)Tests",
            deploymentTarget: self.deploymentTarget,
            sources: "\(self.name)Tests",
            dependencies: dependencies
        )
    }
}
