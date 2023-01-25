//
//  LandmarkAPI.swift
//  Landmarks
//
//  Created by Joakim Hummer on 2023-01-25.
//

import Foundation

struct Response: Codable {
    var items: [Result]
}

struct Result: Codable {
    var id: Int
    var title: String
    var category: String
    var city: String
    var state: String
    var description: String
    var coordinate_latitude: String
    var coordinate_longitude: String
    var image: APIImage
}

struct APIImage: Codable {
    var full_url: String
}

