
final class SpriteMapper: Mapper {
    
    func apply(input: SpriteResponse) -> Sprite {
        return Sprite(
            dreamWorldUrl: input.other.dream_world.front_default,
            standard: input.other.home.front_default
        )
    }
}
