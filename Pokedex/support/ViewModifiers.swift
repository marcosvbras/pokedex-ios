import SwiftUI

struct FullScreen: ViewModifier {
    
    func body(content: Content) -> some View {
        content.frame(width: .infinity, height: .infinity)
    }
}

struct FillHeight: ViewModifier {
    
    func body(content: Content) -> some View {
        content.frame(height: .infinity)
    }
}

struct FillWidth: ViewModifier {
    
    func body(content: Content) -> some View {
        content.frame(width: .infinity)
    }
}
