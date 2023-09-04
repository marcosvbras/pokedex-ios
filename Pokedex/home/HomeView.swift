import SwiftUI

struct HomeView: View {
    
    @State var searchCriteria: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                SearchSectionView()
                
                NewsSectionView()
            }
        }
        .background(.white)
    }
    
    func SearchSectionView() -> some View {
        VStack(alignment: .leading) {
            Text(Strings.Home.greetingsHeader)
                .font(.system(.largeTitle, weight: .bold))
                .padding(Sizes.Padding.medium)
            
            VStack(alignment: .leading) {
                Text(Strings.Home.searchTitle)
                    .font(.system(size: 26))
                
                SearchBoxView()
                    .padding(.bottom, 20)
            }
            .padding(.horizontal, Sizes.Padding.medium)
        }
        .background(.white)
    }
    
    func NewsSectionView() -> some View {
        VStack {
            PokemonCard()
            
            PokemonCard()
            
            PokemonCard()
            
            Spacer()
                .frame(height: Sizes.TabBar.safeArea)
        }
        .background(Colors.lightGray)
    }
    
    func PokemonCard() -> some View {
        VStack {
            Text("Pokémon of the day")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .bold))
            
            Image("charizard")
                .resizable()
                .renderingMode(.original)
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .background(Colors.orange)
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
