import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                SearchSectionView()
                
                NewsSectionView()
            }
        }
        .background(.white)
    }
    
    private func SearchSectionView() -> some View {
        VStack(alignment: .leading) {
            Text(Strings.Home.greetingsHeader)
                .font(.system(.largeTitle, weight: .bold))
                .padding(Sizes.Padding.medium)
            
            VStack(alignment: .leading) {
                Text(Strings.Home.searchTitle)
                    .font(.system(size: 26))
                
                SearchField(prompt: Strings.General.searchPokemonPrompt)
                    .padding(.bottom, 20)
                    .background(
                        alignment: .top, content: {
                            Image(Icons.homeBackground1)
                                .resizable()
                                .frame(width: 43, height: 43)
                                .opacity(0.1)
                                .offset(x: 80, y: -36)
                        }
                    )
            }
            .padding(.horizontal, Sizes.Padding.medium)
            .padding(.top, Sizes.Padding.large)
        }
        .background(
            alignment: .trailing, content: {
                Image(Icons.filledPokeball)
                    .resizable()
                    .frame(width: 220, height: 220)
                    .opacity(0.1)
                    .offset(x: 105, y: -55)
            }
        )
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
                .fillWidth()
                .frame(alignment: .leading)
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
        .fillWidth()
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
