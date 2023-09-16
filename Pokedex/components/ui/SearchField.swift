import SwiftUI

struct SearchField: View {
    
    @State var searchTerm = ""
    var height: CGFloat = 60
    @FocusState var isFocused: Bool
    var prompt: LocalizedStringKey
    
    var body: some View {
        HStack {
            SearchIcon()
            
            SearchInputField()
                .fillHeight()
        }
        .frame(height: height)
        .background(Colors.lightGray)
        .cornerRadius(Sizes.Radius.standard)
        .shadow(radius: isFocused ? 3 : 0, x: 0, y: isFocused ? 0.5 : 0)
    }
    
    private func SearchIcon() -> some View {
        Image(Icons.search)
            .resizable()
            .renderingMode(.template)
            .frame(width: 22, height: 22)
            .padding(.leading, Sizes.Padding.medium)
            .foregroundColor(isFocused ? .accentColor : .black)
    }
    
    private func SearchInputField() -> some View {
        TextField(
            "",
            text: $searchTerm,
            prompt: Text(prompt)
        )
        .padding(.trailing, Sizes.Padding.medium)
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .onSubmit {}
        .focused($isFocused)
        .onChange(of: isFocused) { isFocused in
            self.isFocused = isFocused
        }
    }
}

// MARK: Previews

struct SearchField_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchField(prompt: "Preview Prompt")
            .padding()
    }
}
