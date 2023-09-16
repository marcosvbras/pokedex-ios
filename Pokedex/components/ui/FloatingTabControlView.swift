import SwiftUI

struct FloatingTabControlView: View {
    
    let tabItems: [TabViewItemUiModel]
    @Binding var selectedIndex: Int
    var containerHeight: CGFloat = Sizes.TabBar.height
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(TabViewItemUiModel.allCases, id: \.self) { item in
                TabButton(
                    imageName: item.iconName,
                    title: item.title,
                    isActive: (selectedIndex == item.rawValue),
                    containerHeight: containerHeight
                ) {
                    selectedIndex = item.rawValue
                }
            }
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 1)
        .frame(maxHeight: containerHeight)
        .background(.white)
        .cornerRadius(Sizes.Radius.standard)
        .shadow(radius: 5, x: 0, y: 1)
    }
    
    private func TabButton(
        imageName: String,
        title: LocalizedStringKey,
        isActive: Bool,
        containerHeight: CGFloat,
        clickAction: @escaping () -> Void
    ) -> some View {
        Button {
            clickAction()
        } label: {
            VStack(spacing: Sizes.Padding.xSmall) {
                Spacer()

                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? .white : .gray)
                    .frame(width: 20, height: 20)

                Text(title)
                    .font(Font.system(size: 14))
                    .foregroundColor(isActive ? .white : .gray)

                Spacer()
            }
            .frame(width: 100, height: containerHeight - 10)
            .background(
                ZStack {
                    if isActive {
                        RoundedRectangle(cornerRadius: Sizes.Radius.standard - 4)
                            .fill(Color.accentColor)
                            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    }
                }
            )
        }
    }
}

// MARK: Previews
struct FloatingTabControlView_Previews: PreviewProvider {
    
    @State private static var selectedIndex: Int = 0
    
    static var previews: some View {
        Group {
            FloatingTabControlView(
                tabItems: TabViewItemUiModel.allCases,
                selectedIndex: $selectedIndex,
                containerHeight: Sizes.TabBar.height
            )
            .previewDisplayName("Medium Size (Standard)")
            
            FloatingTabControlView(
                tabItems: TabViewItemUiModel.allCases,
                selectedIndex: $selectedIndex,
                containerHeight: 100
            )
            .previewDisplayName("Large Size")
            
            FloatingTabControlView(
                tabItems: TabViewItemUiModel.allCases,
                selectedIndex: $selectedIndex,
                containerHeight: 55
            )
            .previewDisplayName("Small Size")
        }
    }
}
