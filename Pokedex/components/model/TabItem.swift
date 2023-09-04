import SwiftUI

enum MainTabItem: Int, CaseIterable {
    case home
    case captured
    case favorite
    
    var title: LocalizedStringKey {
        switch self {
        case .home:
            return Strings.TabType.home
        case .captured:
            return Strings.TabType.pokedex
        case .favorite:
            return Strings.TabType.favorites
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return Icons.home
        case .captured:
            return Icons.pokeball
        case .favorite:
            return Icons.favorite
        }
    }
}
