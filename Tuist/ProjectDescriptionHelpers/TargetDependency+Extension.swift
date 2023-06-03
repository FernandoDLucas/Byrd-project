//
//  TargetDependency+Extension.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 28/05/23.
//

import ProjectDescription
import MyPlugin

extension TargetDependency {

    public static func with(_ dependency: [any DependencyProtocol.Type]) -> [TargetDependency] {
        var dependencies: [TargetDependency] = []
        dependency.forEach {
            $0.allCases.forEach {
                if let framework = $0 as? (any DependencyProtocol) {
                    dependencies.append(framework.target)
                }
            }
        }
        return dependencies
    }

    public static func external(_ dependency: ExternalDependency) -> TargetDependency {
        dependency.target
    }

    public static func system(_ dependency: SystemDependency) -> TargetDependency {
        dependency.target
    }

    public static func dependency(_ dependency: Dependency) -> TargetDependency {
        dependency.target
    }

}
