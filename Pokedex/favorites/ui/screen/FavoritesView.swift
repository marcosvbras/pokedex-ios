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
    
    @State private var selectedDisplayLayout: Int = 0
    @State private var shouldShowSettings: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchToolbarView(isSettingsOpen: $shouldShowSettings) {
                shouldShowSettings.toggle()
            }
            .padding(.horizontal, Sizes.Padding.medium)
            .padding(.top, Sizes.Padding.medium)
            .padding(.bottom, Sizes.Padding.small)
            
            if shouldShowSettings {
                Text(Strings.General.displayLayoutTitle)
                    .padding(.leading, Sizes.Padding.medium)
                
                SegmentedControlView(preselectedIndex: $selectedDisplayLayout, options: [Strings.General.displayLayoutItemList, Strings.General.displayLayoutItemGrid])
                    .padding(.horizontal, Sizes.Padding.medium)
                    .padding(.top, Sizes.Padding.xxxSmall)
            }
            
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
