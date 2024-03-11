//
//  HeroesViewModel.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation

class HeroesViewModel: ObservableObject {
    let heroesRepository: HeroesRepository
    
    @Published private(set) var heroes: [HeroesResponseElement] = []
    
    init() {
        self.heroesRepository = HeroesRepository.shared
        viewOnAppear()
    }
    
    func viewOnAppear() {
        Task {
            do {
                let fetchedData = try await heroesRepository.getAllHeroes()
                await MainActor.run {
                    heroes = fetchedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
