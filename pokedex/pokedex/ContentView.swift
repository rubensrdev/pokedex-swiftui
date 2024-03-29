//
//  ContentView.swift
//  pokedex
//
//  Created by Ruben on 28/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear() {
                    PokeApi().getData() { pokemon in
                        print("Number of pokemons: \(pokemon.count)")
                        for pokemon in pokemon {
                            print(pokemon.name)
                        }
                    }
                    PokemonSelectedApi().getData(url: "https://pokeapi.co/api/v2/pokemon/1/") { url in
                        print("Sprites of bulbasur -> \(url)")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
