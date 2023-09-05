import SwiftUI

struct SegmentedControlView: View {
    
    @Binding var preselectedIndex: Int
    var options: [LocalizedStringKey]
    let color = Color.accentColor
    @Namespace private var namespace
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(Colors.lightGray)
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(Sizes.Radius.standard)
                        .shadow(radius: isSelected ? 2 : 0, x: 0, y: isSelected ? 0.5 : 0)
                        .padding(3)
                        .cornerRadius(Sizes.Radius.standard)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(
                                .interactiveSpring(response: 0.2, dampingFraction: 2, blendDuration: 0.3)) {
                                preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .foregroundColor(isSelected ? .white : .gray)
                )
            }
        }
        .frame(height: 40)
        .cornerRadius(Sizes.Radius.standard)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    
    @State static var preselectedIndex = 0
    
    static var previews: some View {
        SegmentedControlView(preselectedIndex: $preselectedIndex, options: ["Option 1", "Option 2"])
            .padding()
    }
}
