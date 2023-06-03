//
//  Dependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//

import ProjectDescription

public enum Dependency: String, DependencyProtocol {
    case compass, compassInterface, dI 

    public var target: ProjectDescription.TargetDependency {
        .project(
            target: self.identifier,
            path: .relativeToRoot("Targets/\(self.identifier)")
        )
    }
}
