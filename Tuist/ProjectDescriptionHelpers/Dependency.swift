//
//  Dependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//

import ProjectDescription

public enum Dependency: String, DependencyProtocol {
    case compass
    case compassInterface
    case dI
    case land = "Land/Land"
    case landData  = "Land/LandData"
    case landDataInterface  = "Land/LandDataInterface"
    case landDomain = "Land/LandDomain"
    case landDomainInterface = "Land/LandDomainInterface"
    case landInterface = "Land/LandInterface"

    public var target: ProjectDescription.TargetDependency {
        .project(
            target: self.target,
            path: .relativeToRoot("Targets/\(self.path)")
        )
    }
}
