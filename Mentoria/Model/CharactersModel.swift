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

struct Wand: Codable {
    let wood: String
    let core: String
}

struct Character: Codable {
    let name: String
    let house: String
    let ancestry: String
    let patronus: String
    let wand: Wand
    let image: String
    let alternateNames: [String]
    
    var imageUrl: String {
        if image.isEmpty {
            return Constants.imageNotFoundDobby
        } else {
            return image
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case house
        case ancestry
        case patronus
        case image
        case alternateNames = "alternate_names"
        case wand
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
