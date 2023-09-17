import SwiftUI

struct RippleImageView: View {
    
    let url: String
    let imageSize: CGFloat
    let rippleSize: CGFloat
    let onImageLoaded: (_ image: Image) -> Void?
    
    var body: some View {
        CacheAsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .onAppear { onImageLoaded(image) }
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: imageSize, maxHeight: imageSize)
        .padding()
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize, height: rippleSize))
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize * 0.88, height: rippleSize * 0.88))
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize * 0.76, height: rippleSize * 0.76))
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize * 0.64, height: rippleSize * 0.64))
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize * 0.52, height: rippleSize * 0.52))
        .background(Circle()
            .fill(.white.opacity(0.04))
            .frame(width: rippleSize * 0.40, height: rippleSize * 0.40))
    }
}

struct RippleImageView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            RippleImageView(
                url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/7.png",
                imageSize: 80,
                rippleSize: 170,
                onImageLoaded: { image in }
            )
        }
        .background(.black)
        .fullScreen()
        .previewLayout(.fixed(width: .infinity, height: .infinity))
    }
}
