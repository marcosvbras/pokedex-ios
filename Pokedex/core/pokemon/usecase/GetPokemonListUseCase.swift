import Combine
import Alamofire

final class GetPokemonListUseCase: UseCase {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository = PokemonRepository()) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(params: Void) -> AnyPublisher<[Pokemon], AFError> {
        return pokemonRepository.getPokemonList(limit: 20, offset: 0)
            .flatMap(loadPokemons)
            .eraseToAnyPublisher()
    }
    
    private func loadPokemons(list: [PokemonListItem]) -> AnyPublisher<[Pokemon], AFError> {
        let publishers: [AnyPublisher<Pokemon, AFError>] = list.map {
            pokemonRepository.getPokemonInfo(withId: $0.id)
        }
                
        return Publishers.MergeMany(publishers)
            .collect(publishers.count)
            .eraseToAnyPublisher()
    }
}
