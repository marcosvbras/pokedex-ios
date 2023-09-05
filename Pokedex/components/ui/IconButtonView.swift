import SwiftUI

struct IconButtonView: View {
    
    var icon: String
    var width: CGFloat
    var height: CGFloat
    var foregroundColor: Color = Color.black
    var clickAction: () -> Void
    
    var body: some View {
        Button {
            clickAction()
        } label: {
            Image(icon)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(foregroundColor)
                .padding(Sizes.Padding.medium)
        }
        .frame(width: width, height: height)
        .background(Colors.lightGray)
        .cornerRadius(Sizes.Radius.standard)
    }
}

struct IconButtonView_Previews: PreviewProvider {

    static var previews: some View {
        IconButtonView(icon: Icons.settings, width: 100, height: 100) {}
    }
}
