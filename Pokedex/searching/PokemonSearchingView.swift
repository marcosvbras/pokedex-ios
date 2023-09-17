import SwiftUI

struct PokemonSearchingView: View {
    
    @ObservedObject private var viewModel = PokemonSearchingViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchField(prompt: Strings.General.searchPokemonPrompt)
                .padding(.bottom, 5)
                .padding(.horizontal, Sizes.Padding.medium)
                .padding(.top, 40)
            
            List(viewModel.pokemons, id: \.id) { item in
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
