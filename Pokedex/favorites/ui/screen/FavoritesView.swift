import SwiftUI

struct FavoritesView: View {
    
    let items = [
        FavoriteItemUiModel(image: "magneton", name: "Magneton", types: [TypeUiModel(label: "Electric"), TypeUiModel(label: "Steel")]),
        FavoriteItemUiModel(image: "charizard", name: "Charizard", types: [TypeUiModel(label: "Fire")]),
        FavoriteItemUiModel(image: "rattata", name: "Rattata", types: [TypeUiModel(label: "Normal")]),
        FavoriteItemUiModel(image: "squirtle1", name: "Squirtle", types: [TypeUiModel(label: "Water")]),
        FavoriteItemUiModel(image: "jigglypuff", name: "Jigglypuff", types: [TypeUiModel(label: "Normal"), TypeUiModel(label: "Fairy")]),
        FavoriteItemUiModel(image: "bulbasaur", name: "Bulbasaur", types: [TypeUiModel(label: "Grass"), TypeUiModel(label: "poison")]),
        FavoriteItemUiModel(image: "pikachu", name: "Pikachu", types: [TypeUiModel(label: "Electric")])
    ]
    
    var body: some View {
        VStack {
            SearchBoxView()
                .padding(.horizontal, Sizes.Padding.medium)
                .padding(.top, Sizes.Padding.medium)
                .padding(.bottom, Sizes.Padding.small)
            
            List(items, id: \.id) { item in
                FavoriteCardView(uiModel: item)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: Sizes.Padding.small, leading: Sizes.Padding.medium, bottom: Sizes.Padding.small, trailing: Sizes.Padding.medium))
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
