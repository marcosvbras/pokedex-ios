import SwiftUI

struct IconButtonView<InnerImage: View>: View {
    
    var width: CGFloat
    var height: CGFloat
    @ViewBuilder let innerImage: () -> InnerImage
    var clickAction: () -> Void
    
    var body: some View {
        Button {
            clickAction()
        } label: {
            innerImage()
        }
        .frame(width: width, height: height)
        .background(Colors.lightGray)
        .cornerRadius(Sizes.Radius.standard)
    }
}

// MARK: Previews
struct IconButtonView_Previews: PreviewProvider {

    static var previews: some View {
        IconButtonView(
            width: 200,
            height: 200,
            innerImage: {
                Image(Icons.favorite)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.black)
                    .padding(Sizes.Padding.medium)
            },
            clickAction: {}
        )
    }
}
