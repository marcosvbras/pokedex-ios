import SwiftUI

extension View {
    
    func fullScreen() -> some View {
        modifier(FullScreen())
    }
    
    func fillHeight() -> some View {
        modifier(FillHeight())
    }
    
    func fillWidth() -> some View {
        modifier(FillWidth())
    }
}
