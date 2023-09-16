import SwiftUI

struct SearchToolbarView<CollapsibleContent: View>: View {
    
    @FocusState private var isSearchFocused: Bool
    @State private var isSettingsOpen: Bool = false
    var prompt: LocalizedStringKey
    @ViewBuilder var collapsibleContent: () -> CollapsibleContent
    
    var body: some View {
        VStack {
            HStack {
                SearchField(
                    height: 60,
                    isFocused: _isSearchFocused,
                    prompt: prompt
                )

                IconButtonView(
                    width: 60,
                    height: 60,
                    innerImage: {
                        SettingsImage()
                    },
                    clickAction: {
                        onSettingsClicked()
                    }
                )
                .shadow(radius: isSettingsOpen ? 3 : 0, x: 0, y: isSettingsOpen ? 0.5 : 0)
            }

            if isSettingsOpen {
                collapsibleContent()
            }
        }
    }
    
    private func SettingsImage() -> some View {
        Image(isSettingsOpen ? Icons.close : Icons.settings)
            .renderingMode(.template)
            .resizable()
            .foregroundColor(isSettingsOpen ? .accentColor : Color.black)
            .padding(Sizes.Padding.medium)
    }
    
    private func onSettingsClicked() {
        self.isSearchFocused = false
        self.isSettingsOpen.toggle()
    }
}

struct SearchToolbarView_Previews: PreviewProvider {

    @State static var closedSettings: Bool = false
    @State static var openSettings: Bool = true

    static var previews: some View {
        Group {
            SearchToolbarView(
                prompt:Strings.General.searchPokemonPrompt,
                collapsibleContent: {
                    Text("Collapsible Preview")
                }
            )
            .padding(Sizes.Padding.medium)
            .previewDisplayName("Open Settings")
        }

    }
}
