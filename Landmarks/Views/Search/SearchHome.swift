
import SwiftUI

struct SearchHome: View {
    @State var searchText = ""
    @State var searching = false
    
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelProductData
    
    var filteredLandmarks: [Product] {
        modelData.products.filter { product in
            (!showFavoritesOnly || product.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(searchText: $searchText, searching: $searching)
//                List {
//                    ForEach(filteredLandmarks) { product in
//                        NavigationLink(destination: LandmarkDetail(product: product)) {
//                            LandmarkRow(product: product)
//                        }
//                    }
//                }
//                .navigationTitle("Kategorie")
                
                List {
                    ForEach(modelData.products.filter({ (product: Product) -> Bool in
                        return product.name.lowercased().contains(searchText.lowercased()) || searchText == ""
                    }), id: \.self) { product in
                        NavigationLink(destination: LandmarkDetail(product: product)) {
                            LandmarkRow(product: product)
                        }
                    }
                }.listStyle(InsetListStyle())
//                    .listStyle(GroupedListStyle())
                    .navigationTitle(searching ? "Szukanie" : "Szukaj")
                    .toolbar {
                        if searching {
                            Button("Cancel") {
                                searchText = ""
                                withAnimation {
                                   searching = false
                                   UIApplication.shared.dismissKeyboard()
                                }
                            }
                        }
                    }
                    .gesture(DragGesture()
                                .onChanged({ _ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                    )
            }
        }
    }
}

struct SearchHome_Previews: PreviewProvider {
    static var previews: some View {
        SearchHome().environmentObject(ModelProductData())
    }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.white))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
    }
}
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
