//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Joakim Hummer on 2023-01-25.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Result
    
    var body: some View {
        HStack {
            LandmarkImage(landmark: landmark)
            .frame(width: 50, height: 50)
            Text(landmark.title)
            Text(landmark.category)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: Result(id: 1, title: "Places 1", category: "vandra", city: "Bollnäs", state: "Hälsingland", description: "blablabla", coordinate_latitude: "61.346713", coordinate_longitude: "16.419067", image: APIImage(full_url: "http://localhost:8000/media/original_images/Flottarleden_skylt_webb.jpeg")))
    }
}
