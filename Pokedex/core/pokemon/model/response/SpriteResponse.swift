
struct SpriteResponse: Codable {
    let other: OtherSpriteResponse
}

struct OtherSpriteResponse: Codable {
    let dream_world: DreamWorldSpriteResponse
    let home: HomeSpriteResponse
}

struct DreamWorldSpriteResponse: Codable {
    let front_default: String
}

struct HomeSpriteResponse: Codable {
    let front_default: String
}
