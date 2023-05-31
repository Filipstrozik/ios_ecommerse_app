import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelProductData
    @State private var showingProfile = false
    var filteredLandmarks: [Product] {
        modelData.products.filter { product in
            (!showFavoritesOnly || product.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
//                    Text(key).fontWeight(.bold)
                    DisclosureGroup(key) {
                        ForEach(modelData.categories[key]!) { product in
                            NavigationLink(destination: LandmarkDetail(product: product)) {
                                LandmarkRow(product: product)}
                        }
                    }
                    //                    CategoryRow(categoryName: key, items: modelData.categories[key]!)

                }
            }.listStyle(InsetListStyle())
            .navigationTitle("Kategorie")
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
//                NavigationView {
//                    List {
//                        Toggle(isOn: $showFavoritesOnly) {
//                            Text("Tylko ulubiones")
//                        }
//
//                        ForEach(filteredLandmarks) { product in
//                            NavigationLink(destination: LandmarkDetail(product: product)) {
//                                LandmarkRow(product: product)
//                            }
//                        }
//                    }
//                    .navigationTitle("Kategorie")
//                }
    }
    
    struct LandmarkList_Previews: PreviewProvider {
        static var previews: some View {
            LandmarkList()
                .environmentObject(ModelProductData())
        }
    }
}
