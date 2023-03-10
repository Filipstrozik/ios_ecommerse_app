import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Product]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title)
                .padding(.leading, 15.0)
                .padding(.vertical, 15.0)
            
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
        }.padding(.vertical, 15.0)
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
