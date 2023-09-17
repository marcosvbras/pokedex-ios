
struct SearchingItemUiModelMapper: Mapper {
    
    func apply(input: Pokemon) -> SearchingItemUiModel {
        return SearchingItemUiModel(
            image: input.sprites.standard,
            name: input.name,
            types: input.types.map { TypeUiModel(label: $0) }
        )
    }
}
