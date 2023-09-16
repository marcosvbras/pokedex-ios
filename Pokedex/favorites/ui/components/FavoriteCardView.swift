import SwiftUI

struct FavoriteCardView: View {
    
    var uiModel: FavoriteItemUiModel
    @State private var backgroundColor: Color = .clear
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(uiModel.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    if !uiModel.types.isEmpty {
                        BadgeView(label: uiModel.types.first!.label)
                    }
                    
                    if uiModel.types.count > 1 {
                        BadgeView(label: "+\(uiModel.types.count - 1)")
                    }
                }
            }
            .padding()
            
            Spacer()
            
            RippleImageView(image: uiModel.image)
        }
        .fillWidth()
        .frame(maxHeight: 130)
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(radius: 2, x: 0, y: 1)
        .onAppear {
            self.setAverageColor(image: uiModel.image)
        }
    }
    
    private func setAverageColor(image: String) {
        let uiColor = UIImage(named: image)?.findAverageColor(algorithm: .squareRoot) ?? .clear
        backgroundColor = Color(uiColor)
    }
}

struct FavoriteCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            FavoriteCardView(
                uiModel: FavoriteItemUiModel(image: "bulbasaur", name: "Bulbasaur", types: [TypeUiModel(label: "Grass"), TypeUiModel(label: "poison")])
            )
            .padding()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Two or more types")
            
            FavoriteCardView(
                uiModel: FavoriteItemUiModel(image: "bulbasaur", name: "Bulbasaur", types: [TypeUiModel(label: "Grass")])
            )
            .padding()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("One type")
        }
    }
}
