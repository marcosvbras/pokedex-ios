
struct FavoritePokemonUiModelMapper: Mapper {
    
    func apply(input: Pokemon) -> FavoriteItemUiModel {
        return FavoriteItemUiModel(
            image: input.sprites.standard,
            name: input.name,
            types: input.types.map { TypeUiModel(label: $0) }
        )
    }
}
