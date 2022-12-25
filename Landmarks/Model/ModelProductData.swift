import Foundation
import Combine

final class ModelProductData: ObservableObject {
    @Published var products: [Product] = load("productData.json")
    @Published var profile = Profile.default
    
    var features: [Product] {
        products.filter { $0.isFeatured }
    }
    
    var categories: [String: [Product]] {
        Dictionary(grouping: products, by: { $0.category.rawValue })
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}

