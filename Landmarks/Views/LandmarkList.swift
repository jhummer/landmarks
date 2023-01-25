//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Joakim Hummer on 2023-01-25.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { item in
                NavigationLink {
                    LandmarkDetail(landmark: item)
                } label: {
                    LandmarkRow(landmark: item)
                }
            }
            .navigationTitle("Landmarks")
        }
        .task {
            await loadData()
        }
    }
    
    
    func loadData() async {
        
        guard let url = URL(string: "http://localhost:8000/api/pages/?type=landmarks.LandmarkPage&fields=*") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.items
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
