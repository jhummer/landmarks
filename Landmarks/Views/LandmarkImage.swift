//
//  LandmarkImage.swift
//  Landmarks
//
//  Created by Joakim Hummer on 2023-01-25.
//

import SwiftUI

struct LandmarkImage: View {
    var landmark: Result
    
    var body: some View {
        AsyncImage(url: URL(string: landmark.image.full_url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct LandmarkImage_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkImage(landmark: Result(id: 1, title: "Places 1", category: "vandra", city: "Bollnäs", state: "Hälsingland", description: "blablabla", coordinate_latitude: "61.346713", coordinate_longitude: "16.419067", image: APIImage(full_url: "http://localhost:8000/media/original_images/Flottarleden_skylt_webb.jpeg")))
    }
}
