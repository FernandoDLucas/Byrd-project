//
//  LandComponent.swift
//  Byrd
//
//  Created by Fernando de Lucas da Silva Gomes on 14/06/23.
//  Copyright © 2023 com.fernanddolucas.Byrd. All rights reserved.
//

import Foundation

struct LandGroup {
    let components: [LandComponent]
}

struct LandComponent: Decodable {

    let id: String
    let componentType: String
    let landItem: [DynamicItem<LandItem>]
    
    enum CodingKeys: String, CodingKey {
        case id,
             componentType,
             landItem
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.componentType = try container.decode(String.self, forKey: .componentType)
        self.landItem = try container.decode([DynamicItem<LandItem>].self, forKey: .landItem)
    }
}

protocol LandItem: Codable {
    static var id: String {get}
}

extension LandItem {
    static var id: String {
        String(describing: Self.self)
    }
}

struct Image: LandItem {
    let imageURLString: String
}

enum DynamicCodableError: Error {
    case missingTypes
    case unableToFindType(String)
    case unableToCast(decoded: LandItem, into: String)
    case unableToRepresentForEncoding
}

enum PolymorphicMetaContainerKeys: CodingKey {
    case _type
}

extension CodingUserInfoKey {
    static var polymorphicTypes: CodingUserInfoKey {
        CodingUserInfoKey(rawValue: "com.codable.polymophicTypes")!
    }
}

extension Decoder {

    func decode<ExpectedType>(
        _ expectedType: ExpectedType.Type
    ) throws -> ExpectedType {
        let container = try self.container(
            keyedBy: PolymorphicMetaContainerKeys.self
        )
        let typeID = try container.decode(String.self, forKey: ._type)
     
        guard let types = self
            .userInfo[.polymorphicTypes] as? [LandItem.Type] else {
                throw DynamicCodableError.missingTypes
        }
     
        let matchingType = types.first { type in
            type.id == typeID
        }
     
        guard let matchingType = matchingType else {
            throw DynamicCodableError
                .unableToFindType(typeID)
        }
     
        let decoded = try matchingType.init(from: self)
     
        guard let decoded = decoded as? ExpectedType else {
            throw DynamicCodableError.unableToCast(
                decoded: decoded,
                into: String(describing: ExpectedType.self)
            )
        }
        return decoded
    }
}

@propertyWrapper
struct DynamicItem<Value> {
    var wrappedValue: Value
}

extension DynamicItem: Decodable {
    init(from decoder: Decoder) throws {
        self.wrappedValue = try decoder.decode(Value.self)
    }
}

final class DataWrapper {

    func execute<T>(
        from data: [DynamicItem<LandItem>],
        get: T.Type
    ) ->  T? {
        data.first {
            ($0.wrappedValue as? T != nil)
        }?.wrappedValue as? T
    }

}
