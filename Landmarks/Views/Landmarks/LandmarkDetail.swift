import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelProductData
    var product: Product
    
    var productIndex: Int {
        modelData.products.firstIndex(where: { $0.id == product.id })!
    }
    
    var body: some View {
        ScrollView {
//            MapView(coordinate: product.locationCoordinate)
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
            
            CircleImage(image: product.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                
            VStack(alignment: .leading) {
                HStack {
                    Text(product.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    FavoriteButton(isSet: $modelData.products[productIndex].isFavorite)
                }
                
                HStack {
//                    Text(product.park)
                    Spacer()
//                    Text(product.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(product.name)")
                    .font(.title2)
                Text(product.description)
            }
            .padding()
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelProductData()
    
    static var previews: some View {
        LandmarkDetail(product: modelData.products[0])
            .environmentObject(modelData)
    }
}
