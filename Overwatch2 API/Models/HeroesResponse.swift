//
//  HeroesResponse.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation

// MARK: - HeroesResponseElement
struct HeroesResponseElement: Codable, Identifiable {
    let id = UUID()
    let key, name: String
    let portrait: URL
    let role: Role
}

// MARK: - Role
enum Role: String, Codable {
    case damage = "damage"
    case support = "support"
    case tank = "tank"
    
    var description: String {
        rawValue.capitalized
    }
}
