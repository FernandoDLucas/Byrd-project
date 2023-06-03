//
//  SystemDependency.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//

import ProjectDescription

public enum SystemDependency: String, DependencyProtocol {
    case uIKit
    case swiftUI
    case foundation
    case coreGraphics
    
    public var target: TargetDependency {
        .sdk(name: self.identifier, type: .framework)
    }
}
