//
//  PokemonImage.swift
//  pokedex
//
//  Created by Ruben on 1/4/24.
//

import SwiftUI

struct PokemonImage: View {
    
    @State private var pokemonSprite = ""
    var imageLink = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear {
                
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print(("New URL! Caching..."))
                } else {
                    getSprite(url: loadedData!)
                    print("Using cached URL...")
                }
                
            }
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .foregroundStyle(Color.gray.opacity(0.6))
    }
    
    func getSprite(url: String) {
        var spritetemp: String?
        PokemonSelectedApi().getData(url: url) { sprite in
            spritetemp = sprite.front_default
            self.pokemonSprite = spritetemp ?? "placeholder"
        }
    }
}

#Preview {
    PokemonImage()
}
