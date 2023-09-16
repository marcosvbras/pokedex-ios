import SwiftUI

struct CollapsibleListSettings: View {
    
    @Binding var selectedDisplayLayout: Int
    var items: [LocalizedStringKey] = [Strings.General.displayLayoutItemList, Strings.General.displayLayoutItemGrid]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Strings.General.displayLayoutTitle)
                .padding(.leading, Sizes.Padding.small)
                .padding(.top, Sizes.Padding.medium)
            
            SegmentedControlView(
                preselectedIndex: $selectedDisplayLayout,
                options: items
            )
        }
    }
}

struct CollapsibleListSettins_Previews: PreviewProvider {
    
    @State static var selectedDisplayLayout: Int = 0
    
    static var previews: some View {
        CollapsibleListSettings(
            selectedDisplayLayout: $selectedDisplayLayout
        )
    }
}
