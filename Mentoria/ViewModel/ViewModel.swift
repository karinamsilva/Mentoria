//
//  ViewModel.swift
//  Mentoria
//
//  Created by Karina on 04/08/24.
//

import Foundation

class ViewModel {
    
    let service: Service
    
    var filtered: [Sections] = []
    
    init(service: Service) {
        self.service = service
    }
    
    func setupSections(from filtered: [Character]) -> [Sections] {
        let new = [Sections(name: Houses.Gryffindor.rawValue,
                            characters: filtered.filter({ $0.house.contains(Houses.Gryffindor.rawValue)})),
                   Sections(name: Houses.Slytherin.rawValue,
                            characters: filtered.filter({ $0.house.contains(Houses.Slytherin.rawValue)})),
                   Sections(name: Houses.Ravenclaw.rawValue,
                            characters: filtered.filter({ $0.house.contains(Houses.Ravenclaw.rawValue)})),
                   Sections(name: Houses.Hufflepuff.rawValue,
                            characters: filtered.filter({ $0.house.contains(Houses.Hufflepuff.rawValue)}))
        ]
        
        return new
        
    }
    
    func makeRequest(completion: @escaping(Bool) -> Void) {
        service.getCharacters { result in
            switch result {
            case .success(let character):
                self.filtered = self.setupSections(from: character)
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    func searchCharacterByName(with name: String) -> [Sections] {
        let filteredList = filtered.flatMap(\.characters).filter({$0.name.contains(name)})
        return [Sections(name: Constants.sectionResult,
                         characters: filteredList)]
    }
}
