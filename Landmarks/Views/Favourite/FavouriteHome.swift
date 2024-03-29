import SwiftUI

struct FavouriteHome: View {
    @EnvironmentObject var modelData: ModelProductData
    @State private var showingProfile = false
    var filteredLandmarks: [Product] {
        modelData.products.filter { product in
             product.isFavorite
        }
    }
    
    var body: some View {
                NavigationView {
                    List {
                        ForEach(filteredLandmarks) { product in
                            NavigationLink(destination: LandmarkDetail(product: product)) {
                                LandmarkRow(product: product)
                            }
                        }
                    } .listStyle(InsetListStyle())
                    .navigationTitle("Ulubione")
                    .toolbar {
                        Text("\(String(modelData.profile.products.map{$0.price}.reduce(0,+))) PLN"
                        )
                        Button(action: { showingProfile.toggle() }) {
                            Image(systemName: "cart")
                                .accessibilityLabel("Shopping Cart")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environmentObject(modelData)
                    }
                }.navigationViewStyle(.stack)
    }
    
    struct FavouriteHome_Previews: PreviewProvider {
        static var previews: some View {
            FavouriteHome()
                .environmentObject(ModelProductData())
        }
    }
}

