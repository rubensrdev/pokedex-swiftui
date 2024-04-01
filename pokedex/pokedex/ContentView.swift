//
//  ContentView.swift
//  pokedex
//
//  Created by Ruben on 28/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var pokemon = [PokemonEntry]()
    @State var searhText = ""
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(searhText == "" ? pokemon : pokemon.filter( {
                        $0.name.contains(searhText.lowercased())
                    })) { entry in
                        HStack {
                            PokemonImage(imageLink: "\(entry.url)")
                                .padding(.trailing, 25)
                            NavigationLink(
                                "\(entry.name.capitalized)",
                                destination: Text("Detail view for \(entry.name)")
                            )
                        }
                    }
                }
                .onAppear {
                    PokeApi().getData() { pokemon in
                        self.pokemon = pokemon
                    }
                }
                .searchable(text: $searhText)
                .navigationTitle("PokedexUI")
            }
            /* Review api work and get data
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
             */
        }
    }
}

#Preview {
    ContentView()
}
