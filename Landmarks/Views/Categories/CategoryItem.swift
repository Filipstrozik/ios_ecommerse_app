import SwiftUI

struct CategoryItem: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            product.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(product.name)
                .foregroundColor(.primary)
                .font(.title3)
            
            Text("\(String(format: "%.2f", product.price)) PLN")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .font(.headline)
                .multilineTextAlignment(.trailing)
        }
        .padding([.top, .leading, .bottom], 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: ModelProductData().products[0])
    }
}
