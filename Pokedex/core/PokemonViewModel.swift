import Foundation
import Alamofire
import Combine

final class PokemonViewModel: ObservableObject {
    
    @Published var pokemons = [FavoriteItemUiModel]()
    private var cancellableSet: Set<AnyCancellable> = []
    private var favoritePokemonUiModelMapper: FavoritePokemonUiModelMapper
    private var count = 0
    private let getPokemonListUseCase: GetPokemonListUseCase
    
    init(
        favoritePokemonUiModelMapper: FavoritePokemonUiModelMapper = FavoritePokemonUiModelMapper(),
        getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase()
    ) {
        self.favoritePokemonUiModelMapper = favoritePokemonUiModelMapper
        self.getPokemonListUseCase = getPokemonListUseCase
        self.fetchPokemonList()
    }
    
    func fetchPokemonList() {
        if count > 0 {
            return
        }
        
        count += 1
        
        getPokemonListUseCase.execute(params: ())
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { value in
                    self.pokemons = value.map {
                        self.favoritePokemonUiModelMapper.apply(input: $0)
                    }
                }
            )
            .store(in: &cancellableSet)
    }
}
