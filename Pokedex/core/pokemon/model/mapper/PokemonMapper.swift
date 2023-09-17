
final class PokemonMapper: Mapper {
    
    private let spriteMapper: SpriteMapper
    
    init(spriteMapper: SpriteMapper = SpriteMapper()) {
        self.spriteMapper = spriteMapper
    }
    
    func apply(input: PokemonInfoResponse) -> Pokemon {
        return Pokemon(
            id: input.id,
            name: input.name.localizedCapitalized,
            weight: input.weight,
            height: input.height,
            types: mapTypes(input.types),
            sprites: spriteMapper.apply(input: input.sprites)
        )
    }
    
    private func mapTypes(_ typesResponse: [TypeItemResponse]) -> [String] {
        return typesResponse.map {
            $0.type.name
        }
    }
}
