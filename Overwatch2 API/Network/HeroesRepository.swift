//
//  HeroesRepository.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation

class HeroesRepository {
    static let shared = HeroesRepository()
    
    private let manager: NetworkManager
    
    private init() {
        self.manager = NetworkManager.shared
    }
    
    func getAllHeroes() async throws -> [HeroesResponseElement] {
        return try await manager.request(endpoint: .heroes)
    }
    
    func getHeroDetail(hero: HeroesResponseElement) async throws -> HeroResponse {
        return try await manager.request(endpoint: .hero(hero.key))
    }
}
