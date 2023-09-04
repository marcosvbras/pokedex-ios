import SwiftUI

struct BadgeView: View {
    
    let label: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, Sizes.Padding.medium)
                .padding(.vertical, Sizes.Padding.xSmall)
        }
        .background(.black.opacity(0.2))
        .cornerRadius(30)
    }
}

struct BadgeView_Previews: PreviewProvider {
    
    static var previews: some View {
        BadgeView(label: "Preview")
    }
}
