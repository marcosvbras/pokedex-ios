import Foundation

struct FavoriteItemUiModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let types: [TypeUiModel]
}
