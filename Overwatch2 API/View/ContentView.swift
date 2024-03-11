//
//  ContentView.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            HeroesView()
                .navigationTitle("Heroes")
        }
    }
}
