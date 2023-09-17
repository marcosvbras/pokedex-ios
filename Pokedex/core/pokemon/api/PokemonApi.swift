import Alamofire
import Foundation
import Combine

protocol PokemonAPIProtocol {
    
    func fetchPokemonList(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, AFError>
    
    func fetchPokemonInfo(withId: Int) -> AnyPublisher<PokemonInfoResponse, AFError>
}

struct PokemonAPI: PokemonAPIProtocol {
    
    private let endpoint = "pokemon/"
    
    func fetchPokemonList(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, AFError> {
        let url = URL(string: API.baseUrl + endpoint)!

        let parameters = [
            "limit": limit,
            "offset": offset
        ] as [String : Any]

        return AF.request(
            url,
            method: .get,
            parameters: parameters
        )
        .validate()
        .publishDecodable(type: PokemonListResponse.self)
        .value()
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func fetchPokemonInfo(withId: Int) -> AnyPublisher<PokemonInfoResponse, AFError> {
        let url = URL(string: API.baseUrl + endpoint + String(withId))!
        
        return fetchPokemonInfo(url)
    }
    
    func fetchPokemonInfo(withName: String) -> AnyPublisher<PokemonInfoResponse, AFError> {
        let url = URL(string: API.baseUrl + endpoint + withName)!
        
        return fetchPokemonInfo(url)
    }
    
    private func fetchPokemonInfo(_ url: URL) -> AnyPublisher<PokemonInfoResponse, AFError> {
        return AF.request(
            url,
            method: .get
        )
        .validate()
        .publishDecodable(type: PokemonInfoResponse.self)
        .value()
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
