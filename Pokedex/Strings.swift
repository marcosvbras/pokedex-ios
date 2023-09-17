import SwiftUI

enum Strings {
    
    enum TabType {
        static let home: LocalizedStringKey = "home.tab.title"
        static let pokedex: LocalizedStringKey = "pokedex.tab.title"
        static let favorites: LocalizedStringKey = "favorites.tab.title"
    }
    
    enum General {
        static let searchPokemonPrompt: LocalizedStringKey = "search.pokemon.placeholder"
        static let displayLayoutTitle: LocalizedStringKey = "segmented.control.display.layout.title"
        static let displayLayoutItemList: LocalizedStringKey = "segmented.control.item.list"
        static let displayLayoutItemGrid: LocalizedStringKey = "segmented.control.item.grid"
    }
    
    enum Home {
        static let greetingsHeader: LocalizedStringKey = "home.greetings.header"
        static let searchTitle: LocalizedStringKey = "home.search.title"
    }
    
    enum Searching {
        static let emptySearchMessage: LocalizedStringKey = "empty.pokemon.search.title"
    }
}
