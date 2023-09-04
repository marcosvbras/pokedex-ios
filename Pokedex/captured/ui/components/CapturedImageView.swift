import SwiftUI

struct CapturedImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 80, maxHeight: 80, alignment: .trailing)
            .padding()
            .background(
                Image("filledPokeball")
                    .resizable()
                    .foregroundColor(.clear)
                    .opacity(0.1)
                    .frame(width: 250, height: 250)
            )
    }
}

struct CapturedImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            CapturedImageView(image: "jigglypuff")
        }
        .frame(width: .infinity, height: .infinity)
        .previewLayout(.fixed(width: .infinity, height: .infinity))
    }
}
