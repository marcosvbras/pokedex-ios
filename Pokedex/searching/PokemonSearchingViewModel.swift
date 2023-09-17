import Foundation
import Combine

final class PokemonSearchingViewModel: ObservableObject {
    
    @Published var pokemons = [SearchingItemUiModel]()
    private var cancellableSet: Set<AnyCancellable> = []
    private var uiModelMapper: SearchingItemUiModelMapper
    private let getPokemonListUseCase: GetPokemonListUseCase
    
    init(
        favoritePokemonUiModelMapper: SearchingItemUiModelMapper = SearchingItemUiModelMapper(),
        getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase()
    ) {
        self.uiModelMapper = favoritePokemonUiModelMapper
        self.getPokemonListUseCase = getPokemonListUseCase
        self.fetchPokemonList()
    }
    
    func fetchPokemonList() {
        getPokemonListUseCase.execute(params: ())
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { value in
                    self.pokemons = value.map {
                        self.uiModelMapper.apply(input: $0)
                    }
                }
            )
            .store(in: &cancellableSet)
    }
}
