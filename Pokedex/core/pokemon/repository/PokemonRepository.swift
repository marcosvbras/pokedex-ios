import Combine
import Alamofire

protocol PokemonRepositoryProtocol {
    
    func getPokemonList(limit: Int, offset: Int) -> AnyPublisher<[PokemonListItem], AFError>
    
    func getPokemonInfo(withId id: Int) -> AnyPublisher<Pokemon, AFError>
    
    func getPokemonInfo(withName name: String) -> AnyPublisher<Pokemon, AFError>
}

final class PokemonRepository: PokemonRepositoryProtocol {
    
    private let pokemonApi: PokemonAPIProtocol
    private let pokemonMapper: PokemonMapper
    private let pokemonListItemMapper: PokemonListItemMapper
    
    init(
        pokemonApi: PokemonAPIProtocol = PokemonAPI(),
        pokemonMapper: PokemonMapper = PokemonMapper(),
        pokemonListItemMapper: PokemonListItemMapper = PokemonListItemMapper()
    ) {
        self.pokemonApi = pokemonApi
        self.pokemonMapper = pokemonMapper
        self.pokemonListItemMapper = pokemonListItemMapper
    }
    
    func getPokemonList(limit: Int = 20, offset: Int = 0) -> AnyPublisher<[PokemonListItem], AFError> {
        return pokemonApi.fetchPokemonList(limit: limit, offset: offset)
            .map { $0.results }
            .map { responses in
                responses.map { self.pokemonListItemMapper.apply(input: $0) }
            }
            .eraseToAnyPublisher()
    }
    
    func getPokemonInfo(withId id: Int) -> AnyPublisher<Pokemon, AFError> {
        return pokemonApi.fetchPokemonInfo(withId: id)
            .map { response in self.pokemonMapper.apply(input: response) }
            .eraseToAnyPublisher()
    }
    
    func getPokemonInfo(withName name: String) -> AnyPublisher<Pokemon, AFError> {
        return pokemonApi.fetchPokemonInfo(withName: name)
            .map { response in self.pokemonMapper.apply(input: response) }
            .eraseToAnyPublisher()
    }
}
