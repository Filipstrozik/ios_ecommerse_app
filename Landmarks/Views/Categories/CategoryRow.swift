import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Product]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15.0)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 0.0) {
                    ForEach(items) { product in
                        NavigationLink(destination: LandmarkDetail(product: product)) {
                            CategoryItem(product: product)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var products = ModelProductData().products

    static var previews: some View {
        CategoryRow(
            categoryName: products[0].category.rawValue,
            items: Array(products.prefix(4))
        )
    }
}
