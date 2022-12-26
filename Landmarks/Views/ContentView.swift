import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case search
        case list
        case favourite
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Polecane", systemImage: "heart")
                }
                .tag(Tab.featured)
            
            SearchHome()
                .tabItem {
                    Label("Wyszukaj", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            
            LandmarkList()
                .tabItem {
                    Label("Kategorie", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            FavouriteHome()
                .tabItem {
                    Label("Ulubione", systemImage: "star")
                }
                .tag(Tab.favourite)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelProductData())
        
    }
}
