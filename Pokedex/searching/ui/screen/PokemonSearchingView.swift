import SwiftUI

struct PokemonSearchingView: View {
    
    @ObservedObject private var viewModel = PokemonSearchingViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchField(
                prompt: Strings.General.searchPokemonPrompt,
                onSearchSubmited: { search in
                    viewModel.searchPokemon(name: search)
                }
            )
            .padding(.bottom, 5)
            .padding(.horizontal, Sizes.Padding.medium)
            .padding(.top, 40)
            
            if viewModel.state.searchResult.isEmpty {
                Spacer()
                EmptySearchResultView()
                Spacer()
            } else {
                List(viewModel.state.searchResult, id: \.id) { item in
                    SearchingCardView(uiModel: item)
                        .listRowSeparator(.hidden)
                        .listRowInsets(
                            EdgeInsets(
                                top: Sizes.Padding.small,
                                leading: Sizes.Padding.medium,
                                bottom: Sizes.Padding.small,
                                trailing: Sizes.Padding.medium
                            )
                        )
                }
                .listStyle(.plain)
            }
        }
        .fullScreen()
        .onAppear {
            viewModel.fetchPokemonList()
        }
    }
}

struct PokemonSearchingView_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonSearchingView()
    }
}
