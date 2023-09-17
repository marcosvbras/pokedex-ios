import SwiftUI

struct EmptySearchResultView: View {
    
    var body: some View {
        VStack {
            Image(Icons.emptySearch)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 160)
                .foregroundColor(.gray)
                .padding(Sizes.Padding.medium)
            
            Text(Strings.Searching.emptySearchMessage)
                .font(.system(size: 26, weight: .regular))
                .foregroundColor(.gray)
                .padding(Sizes.Padding.medium)
        }
    }
}

struct EmptySearchResultView_Previews: PreviewProvider {
    
    static var previews: some View {
        EmptySearchResultView()
    }
}
