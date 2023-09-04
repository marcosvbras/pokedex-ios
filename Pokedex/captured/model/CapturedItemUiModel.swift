import Foundation

struct CapturedItemUiModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let types: [TypeUiModel]
    let capturedOrder: String
}
