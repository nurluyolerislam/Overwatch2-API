//
//  HeroesView.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import SwiftUI

struct HeroesView: View {
    @StateObject private var viewModel: HeroesViewModel
    
    init() {
        self._viewModel = StateObject(wrappedValue: .init())
    }
    
    var body: some View {
        List {
            ForEach(viewModel.heroes) { hero in
                NavigationLink {
                    HeroDetailView(hero: hero)
                } label: {
                    HeroCell(hero: hero)
                }
            }
        }
    }
}

struct HeroCell: View {
    let hero: HeroesResponseElement
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(hero.name)
                    .font(.largeTitle)
                
                Text(hero.role.description)
                    .font(.caption)
            }
            
            Spacer()
            
            AsyncImage(url: hero.portrait) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView("Loading")
            }
            .frame(width: 100, height: 100)
        }
    }
}
