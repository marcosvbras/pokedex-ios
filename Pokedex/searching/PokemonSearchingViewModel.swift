import Foundation
import Combine

final class PokemonSearchingViewModel: ObservableObject {
    
    @Published var state = PokemonSearchingState()
    private var cancellableSet: Set<AnyCancellable> = []
    private var uiModelMapper: SearchingItemUiModelMapper
    private let getPokemonListUseCase: GetPokemonListUseCase
    private let getPokemonByNameUseCase: GetPokemonByNameUseCase
    
    init(
        favoritePokemonUiModelMapper: SearchingItemUiModelMapper = SearchingItemUiModelMapper(),
        getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(),
        getPokemonByNameUseCase: GetPokemonByNameUseCase = GetPokemonByNameUseCase()
    ) {
        self.uiModelMapper = favoritePokemonUiModelMapper
        self.getPokemonListUseCase = getPokemonListUseCase
        self.getPokemonByNameUseCase = getPokemonByNameUseCase
        self.fetchPokemonList()
    }
    
    func fetchPokemonList() {
        getPokemonListUseCase.execute(params: ())
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { value in
                    self.state.searchResult = value.shuffled().map {
                        self.uiModelMapper.apply(input: $0)
                    }
                }
            )
            .store(in: &cancellableSet)
    }
    
    func searchPokemon(name: String) {
        getPokemonByNameUseCase.execute(params: GetPokemonByNameUseCase.Params(name: name))
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
                        self.state.searchResult = []
                    }
                },
                receiveValue: { value in
                    self.state.searchResult = [self.uiModelMapper.apply(input: value)]
                }
            )
            .store(in: &cancellableSet)
    }
}
