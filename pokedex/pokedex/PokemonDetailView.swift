//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Ruben on 1/4/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var pokemonName = "name"
    var pokemonImage: PokemonImage = PokemonImage()
    
    var body: some View {
        VStack {
            pokemonImage
            Text("\(pokemonName.capitalized)")
                .font(.title2)
                .bold()
        }
        
            
    }
}

#Preview {
    PokemonDetailView()
}
