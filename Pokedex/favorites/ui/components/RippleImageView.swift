import SwiftUI

struct RippleImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 80, maxHeight: 80, alignment: .trailing)
            .padding()
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 170, height: 170))
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 150, height: 150))
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 130, height: 130))
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 110, height: 110))
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 90, height: 90))
            .background(Circle()
                .fill(.white.opacity(0.04))
                .frame(width: 70, height: 70))
    }
}

struct RippleImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            RippleImageView(image: "jigglypuff")
        }
        .background(.black)
        .fullScreen()
        .previewLayout(.fixed(width: .infinity, height: .infinity))
    }
}
