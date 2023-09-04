import SwiftUI

struct CapturedView: View {
    
    let items = [
        CapturedItemUiModel(image: "squirtle1", name: "Squirtle", types: [TypeUiModel(label: "Water")], capturedOrder: "#004"),
        CapturedItemUiModel(image: "magneton", name: "Magneton", types: [TypeUiModel(label: "Electric"), TypeUiModel(label: "Steel")], capturedOrder: "#001"),
        CapturedItemUiModel(image: "charizard", name: "Charizard", types: [TypeUiModel(label: "Fire")], capturedOrder: "#002")
    ]
    
    var body: some View {
        VStack {
            SearchBoxView()
                .padding(.horizontal, Sizes.Padding.medium)
                .padding(.top, Sizes.Padding.medium)
                .padding(.bottom, Sizes.Padding.small)
            
            List(items, id: \.id) { item in
                CapturedCardView(uiModel: item)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: Sizes.Padding.small, leading: Sizes.Padding.medium, bottom: Sizes.Padding.small, trailing: Sizes.Padding.medium))
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CapturedView_Previews: PreviewProvider {
    
    static var previews: some View {
        CapturedView()
    }
}
