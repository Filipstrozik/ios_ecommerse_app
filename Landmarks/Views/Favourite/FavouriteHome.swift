import SwiftUI

struct FavouriteHome: View {
    @EnvironmentObject var modelData: ModelProductData
    
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
                }
    }
    
    struct FavouriteHome_Previews: PreviewProvider {
        static var previews: some View {
            FavouriteHome()
                .environmentObject(ModelProductData())
        }
    }
}

