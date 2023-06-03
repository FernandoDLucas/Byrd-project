//
//  ExternalDependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//

import ProjectDescription

public enum ExternalDependency: String, DependencyProtocol {
    case swinject

    public var target: ProjectDescription.TargetDependency {
        .external(name: self.identifier)
    }
}
