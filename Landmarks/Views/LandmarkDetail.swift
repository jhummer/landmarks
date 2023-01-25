//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Joakim Hummer on 2023-01-25.
//

import SwiftUI
import CoreLocation

struct LandmarkDetail: View {
    var landmark: Result
    
    var landmarkCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(landmark.coordinate_latitude) ?? 61.346713,
            longitude: Double(landmark.coordinate_longitude) ?? 61.346713)
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmarkCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            LandmarkImage(landmark: landmark)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.title)
                    .font(.title)
                
                HStack {
                    Text(landmark.city)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.title)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: Result(id: 1, title: "Places 1", category: "vandra", city: "Bollnäs", state: "Hälsingland", description: "blablabla", coordinate_latitude: "61.346713", coordinate_longitude: "16.419067", image: APIImage(full_url: "http://localhost:8000/media/original_images/Flottarleden_skylt_webb.jpeg")))
    }
}
