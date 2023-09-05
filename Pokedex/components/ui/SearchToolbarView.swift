import SwiftUI

struct SearchToolbarView: View {
    
    @Binding var isSettingsOpen: Bool
    var onSettingsTapped: () -> Void
    
    var body: some View {
        HStack {
            SearchBoxView(height: 60)
            
            IconButtonView(
                icon: isSettingsOpen ? Icons.close : Icons.settings,
                width: 60,
                height: 60,
                foregroundColor: isSettingsOpen ? .accentColor : Color.black
            ) {
                onSettingsTapped()
            }
            .shadow(radius: isSettingsOpen ? 3 : 0, x: 0, y: isSettingsOpen ? 0.5 : 0)
        }
    }
}

struct SearchToolbarView_Previews: PreviewProvider {
    
    @State static var closedSettings: Bool = false
    @State static var openSettings: Bool = true

    static var previews: some View {
        Group {
            SearchToolbarView(isSettingsOpen: $closedSettings, onSettingsTapped: {})
                .padding(Sizes.Padding.medium)
                .previewDisplayName("Closed Settings")
            
            SearchToolbarView(isSettingsOpen: $openSettings, onSettingsTapped: {})
                .padding(Sizes.Padding.medium)
                .previewDisplayName("Open Settings")
        }
        
    }
}
