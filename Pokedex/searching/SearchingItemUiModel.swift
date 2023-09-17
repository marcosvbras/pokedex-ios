import Foundation

struct SearchingItemUiModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let types: [TypeUiModel]
}
