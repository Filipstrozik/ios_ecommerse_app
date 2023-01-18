import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @EnvironmentObject var modelData: ModelProductData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    Text(String(profile.products.map{$0.price}.reduce(0, +))).font(.title).fontWeight(.bold)
                }
                NavigationView{
                    List {
                        ForEach(profile.products) { product in
                            NavigationLink(destination: LandmarkDetail(product: product)) {
                                LandmarkRow(product: product)
                            }
//                            LandmarkRow(product: product)
                        }
                    }.listStyle(InsetListStyle())
                }
                
            }
        }
    }
    
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelProductData())
    }
}
