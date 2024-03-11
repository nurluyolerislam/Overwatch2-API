//
//  HeroDetailViewModel.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation

final class HeroDetailViewModel: ObservableObject {
    private let heroesRepository: HeroesRepository
    
    private let hero: HeroesResponseElement
    
    @Published var heroDetails: HeroResponse?
    
    init(hero: HeroesResponseElement) {
        self.heroesRepository = HeroesRepository.shared
        self.hero = hero
        viewOnAppear()
    }
    
    func viewOnAppear() {
        Task {
            do {
                let fetchedData = try await heroesRepository.getHeroDetail(hero: hero)
                await MainActor.run {
                    heroDetails = fetchedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
