import SwiftUI

struct TabContainerView<Content: View>: View {
    
    let tabItems: [TabViewItemUiModel]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                ForEach(tabItems.indices, id: \.self) { index in
                    content(index)
                        .fullScreen()
                        .ignoresSafeArea()
                        .tag(index)
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            FloatingTabControlView(
                tabItems: self.tabItems,
                selectedIndex: $selectedIndex
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


// MARK: Previews
struct TabContainerView_Previews: PreviewProvider {
    
    @State private static var selectedIndex = 0
    
    static var previews: some View {
        TabContainerView(
            tabItems: TabViewItemUiModel.allCases,
            selectedIndex: $selectedIndex
        ) { index in
            Color.blue
        }
    }
}
