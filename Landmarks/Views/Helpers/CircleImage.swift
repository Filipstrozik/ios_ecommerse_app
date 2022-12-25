import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image.resizable().frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 1)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("maszynka"))
    }
}
