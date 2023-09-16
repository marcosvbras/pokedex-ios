
struct FavoritePokemonUiModelMapper {
    
    func apply(pokemonResponse: PokemonResponse) -> FavoriteItemUiModel {
        return FavoriteItemUiModel(
            image: "magneton",
            name: pokemonResponse.name,
            types: [TypeUiModel(label: "Steel")]
        )
    }
}
