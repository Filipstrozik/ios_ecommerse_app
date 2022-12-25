import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelProductData
    
    var filteredLandmarks: [Product] {
        modelData.products.filter { product in
            (!showFavoritesOnly || product.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Tylko ulubiones")
                }

                ForEach(filteredLandmarks) { product in
                    NavigationLink(destination: LandmarkDetail(product: product)) {
                        LandmarkRow(product: product)
                    }
                }
            }
            .navigationTitle("Kategorie")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelProductData())
    }
}
