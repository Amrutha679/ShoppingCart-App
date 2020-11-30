//
//  pokeData.swift
//  ShopingCart
//
//  Created by amrutha on 28/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation
struct PokemonData: Codable {
    let id: Int?
    let name: String
    let names: [Name]
    let pokemonSpecies: [PokemonSpecy]

    enum CodingKeys: String, CodingKey {
        case id, name, names
        case pokemonSpecies = "pokemon_species"
    }
}

// MARK: - Name
struct Name: Codable {
    let language: PokemonSpecy
    let name: String?
}

// MARK: - PokemonSpecy
struct PokemonSpecy: Codable {
    let name: String
    let url: String
}
