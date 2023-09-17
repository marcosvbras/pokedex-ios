
struct PokemonInfoResponse: Codable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let types: [TypeItemResponse]
    let sprites: SpriteResponse
}
