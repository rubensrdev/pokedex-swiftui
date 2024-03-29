//
//  Pokemon.swift
//  pokedex
//
//  Created by Ruben on 29/3/24.
//

import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi {
    /*
     Este método obtiene la lista de pokemon en poke api en formato json
     y los convierte al model de Pokemon
     */
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}
