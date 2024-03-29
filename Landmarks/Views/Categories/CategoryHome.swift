import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelProductData: ModelProductData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelProductData.features.map { FeatureCard(product: $0) })
                    .aspectRatio(2 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelProductData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelProductData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("el Cartel poleca:")
            .toolbar {
                Text("\(String(modelProductData.profile.products.map{$0.price}.reduce(0,+))) PLN"
                )
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "cart")
                        .accessibilityLabel("Shopping Cart")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelProductData)
            }

        }.navigationViewStyle(.stack)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelProductData())
    }
}
