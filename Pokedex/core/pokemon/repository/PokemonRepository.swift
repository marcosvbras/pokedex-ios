import Combine
import Alamofire

final class PokemonRepository {
    
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
            .map { pokemonResponses in
                pokemonResponses.map { self.pokemonListItemMapper.apply(input: $0) }
            }
            .eraseToAnyPublisher()
    }
    
    func getPokemonInfo(withId: Int) -> AnyPublisher<Pokemon, AFError> {
        return pokemonApi.fetchPokemonInfo(withId: withId)
            .map { pokemonInfoResponse in
                self.pokemonMapper.apply(input: pokemonInfoResponse)
            }
            .eraseToAnyPublisher()
    }
}
