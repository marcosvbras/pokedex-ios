import Combine
import Alamofire

final class GetPokemonByNameUseCase: UseCase {
    
    private let pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol = PokemonRepository()) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(params: Params) -> AnyPublisher<Pokemon, AFError> {
        return pokemonRepository.getPokemonInfo(withName: params.name)
            .eraseToAnyPublisher()
    }
    
    struct Params {
        let name: String
    }
}
