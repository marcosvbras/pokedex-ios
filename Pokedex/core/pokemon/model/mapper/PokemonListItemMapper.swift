import Foundation

struct PokemonListItemMapper: Mapper {
    
    func apply(input: PokemonListItemResponse) -> PokemonListItem {
        return PokemonListItem(
            name: input.name,
            id: mapId(input.url)
        )
    }
    
    private func mapId(_ resourceUrl: String) -> Int {
        let url = URL(string: resourceUrl)!
        
        return Int(url.pathComponents.last!) ?? 0
    }
}
