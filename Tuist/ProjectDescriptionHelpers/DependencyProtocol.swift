//
//  File.swift
//  ProjectDescriptionHelpers
//
//  Created by Fernando de Lucas da Silva Gomes on 30/05/23.
//
import ProjectDescription

public protocol DependencyProtocol: RawRepresentable, CaseIterable {
    var target: TargetDependency { get }
}

extension DependencyProtocol where RawValue == String {
    var identifier: String {
        rawValue.firstUppercased
    }
}

extension StringProtocol {
    public var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
}
