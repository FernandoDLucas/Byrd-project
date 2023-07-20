//
//  Dependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//

import ProjectDescription

public enum TestDependency: String, DependencyProtocol {

    case landTestUtils = "Land/LandInterface"

    public var target: ProjectDescription.TargetDependency {
        .project(
            target: self.target,
            path: .relativeToRoot("Targets/\(self.path)")
        )
    }
}
