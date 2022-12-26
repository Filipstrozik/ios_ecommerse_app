import SwiftUI

struct LandmarkRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            product.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(product.name)
            
            
            
            if product.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Spacer()
            
            Text("\(String(format: "%.2f", product.price)) PLN")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var products = ModelProductData().products

    static var previews: some View {
        Group {
            LandmarkRow(product: products[0])
            LandmarkRow(product: products[1])
            LandmarkRow(product: products[3])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
