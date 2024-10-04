//
//  Service.swift
//  Mentoria
//
//  Created by Karina on 04/08/24.
//

import Foundation

class Service {
    
    func getCharacters(completion: @escaping(Result<[Character], ErrorResult>) -> Void) {
        guard let url = URL(string: Constants.endpoint) else { return }
        let urlRequest = URLRequest(url: url)
        
        let request = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.network))
                return}
            do {
                let decoder = try JSONDecoder().decode([Character].self, from: data)
                completion(.success(decoder))
            } catch {
                print(String(describing: error))
                print(String(describing: error.localizedDescription))
                completion(.failure(.decoding))
            }
        }
        request.resume()
    }
}

