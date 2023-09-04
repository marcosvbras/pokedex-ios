import SwiftUI

struct MainView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        TabContainerView(
            tabs: MainTabItem.allCases,
            selectedIndex: $selectedIndex
        ) { index in
            getTabView(type: MainTabItem.init(rawValue: index) ?? .home)
        }
    }
    
    @ViewBuilder
    func getTabView(type: MainTabItem) -> some View {
        switch type {
        case .home:
            HomeView()
        case .captured:
            CapturedView()
        case .favorite:
            FavoritesView()
        }
    }
    
    func TabStack(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 6) {
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
        .background(isActive ? Color.accentColor : .clear)
        .cornerRadius(30)
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
