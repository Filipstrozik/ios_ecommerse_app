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
            
//            CircleImage(image: product.image)
//                .offset(y: -60)
//                .padding(.bottom, -130)
            
            
            Image(product.imageName).resizable().frame(width: 400, height: 400)
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Text(product.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        
                        FavoriteButton(isSet: $modelData.products[productIndex].isFavorite)

                    }
      
                    HStack {
                        Text("\(String(format: "%.2f", product.price)) PLN")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .font(.title3)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                        Button(action: {modelData.profile.products.append(product)}) {
                            Label("", systemImage: "cart.badge.plus")
                        }.buttonStyle(.bordered)
                            .controlSize(.large)
                    }
                    .font(.subheadline)
                }

                Divider()
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
