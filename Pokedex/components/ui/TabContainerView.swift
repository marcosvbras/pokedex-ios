import SwiftUI

struct TabContainerView<Content: View>: View {
    
    let tabs: [MainTabItem]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .tag(index)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            FloatingTabView(tabItems: tabs, selectedIndex: $selectedIndex)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}
