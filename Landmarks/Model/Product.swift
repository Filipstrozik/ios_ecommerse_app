import Foundation
import SwiftUI
import CoreLocation


struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: Double
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case maszynki = "Maszynki"
        case igly = "Igly"
        case cartridge = "Kartdrize"
        case griptape = "Griptape"

    }
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
}
