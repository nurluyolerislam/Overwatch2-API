//
//  HeroDetailView.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import SwiftUI

struct HeroDetailView: View {
    @StateObject private var viewModel: HeroDetailViewModel
    
    init(hero: HeroesResponseElement) {
        self._viewModel = StateObject(wrappedValue: .init(hero: hero))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let hero = viewModel.heroDetails {
                Group {
                    HStack {
                        AsyncImage(url: hero.portrait) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView("Loading")
                        }
                        .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(hero.name)
                                    .font(.largeTitle)
                                
                                Text(hero.location)
                                    .font(.callout)
                            }
                            Text(hero.role.capitalized)
                        }
                    }
                    Text(hero.description)
                }
                .padding(.horizontal)
                
                List {
                    Section("Abilities") {
                        ForEach(hero.abilities) { ability in
                            NavigationLink {
                                AbilityVideoView(link: ability.video.link)
                            } label: {
                                AbilityCell(ability: ability)
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
}


struct AbilityCell: View {
    let ability: Ability
    var body: some View {
        HStack {
            AsyncImage(url: ability.video.thumbnail) { image in
                image
                    .resizable()
                    .overlay {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
            } placeholder: {
                ProgressView("Loading")
            }
            .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    AsyncImage(url: ability.icon) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView("Loading")
                    }
                    .frame(width: 20, height: 20)
                    Text(ability.name)
                        .font(.title3)
                }
                Text(ability.description)
                    .font(.caption)
            }
        }
    }
}
