import Alamofire
import Foundation
import Combine

protocol PokemonAPIProtocol {
    
    func getPokemons(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, AFError>
}

struct PokemonAPI: PokemonAPIProtocol {
    
    private let endpoint = "pokemon"
    
    func getPokemons(limit: Int = 20, offset: Int = 0) -> AnyPublisher<PokemonListResponse, AFError> {
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
}
