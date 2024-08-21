//
//  CharactersModel.swift
//  Mentoria
//
//  Created by Karina on 14/08/24.
//

import Foundation

struct Sections {
    let name: String
    let characters: [Character]
}

struct Character: Codable, Hashable {
    let name: String
    let house: String
    let image: String
    
    init(name: String, house: String, image: String) {
        self.name = name
        self.house = house
        self.image = image
    }
}

enum ErrorResult: Error {
    case network
    case decoding
}

enum Houses: String {
    case Gryffindor
    case Hufflepuff
    case Ravenclaw
    case Slytherin
}
