import SwiftUI

struct FloatingTabView: View {
    
    let tabItems: [MainTabItem]
    @Binding var selectedIndex: Int
    var height: CGFloat = 70
    @Namespace private var namespace
    
    var body: some View {
        HStack {
            ForEach(MainTabItem.allCases, id: \.self) { item in
                TabButton(imageName: item.iconName, title: item.title, isActive: (selectedIndex == item.rawValue)) {
                    selectedIndex = item.rawValue
                }
            }
        }
        .padding(6)
        .frame(maxHeight: height)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(35)
        .shadow(radius: 5, x: 0, y: 1)
    }
    
    private func TabButton(imageName: String, title: LocalizedStringKey, isActive: Bool, clickAction: @escaping () -> Void) -> some View {
        Button {
            clickAction()
        } label: {
            VStack(spacing: Sizes.Padding.xSmall) {
                let font = isActive ? Font.system(size: 16) : Font.system(size: 14)
                let iconSize: CGFloat = isActive ? 22 : 20

                Spacer()

                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? .white : .gray)
                    .frame(width: iconSize, height: iconSize)

                Text(title)
                    .font(font)
                    .foregroundColor(isActive ? .white : .gray)

                Spacer()
            }
            .frame(width: 100, height: 60)
            .background(
                ZStack {
                    if isActive {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.accentColor)
                            .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    }
                }
            )
        }
    }
}

struct FloatingTabView_Previews: PreviewProvider {
    
    @State static var selectedIndex: Int = 0
    
    static var previews: some View {
        FloatingTabView(
            tabItems: MainTabItem.allCases,
            selectedIndex: $selectedIndex
        )
    }
}
