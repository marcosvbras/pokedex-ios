import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons = [FavoriteItemUiModel]()
    private var cancellableSet: Set<AnyCancellable> = []
    private var pokemonApi: PokemonAPIProtocol
    private var favoritePokemonUiModelMapper: FavoritePokemonUiModelMapper
    
    init(
        pokemonApi: PokemonAPIProtocol = PokemonAPI(),
        favoritePokemonUiModelMapper: FavoritePokemonUiModelMapper = FavoritePokemonUiModelMapper()
    ) {
        self.pokemonApi = pokemonApi
        self.favoritePokemonUiModelMapper = favoritePokemonUiModelMapper
        self.fetchPokemonList()
    }
    
    func fetchPokemonList() {
        pokemonApi.getPokemons(limit: 20, offset: 0)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { value in
                    self.pokemons = value.results.map {
                        self.favoritePokemonUiModelMapper.apply(pokemonResponse: $0)
                    }
                }
            )
            .store(in: &cancellableSet)
    }
}
