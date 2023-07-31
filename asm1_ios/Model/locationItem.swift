//
//  locationItem.swift
//  asm1_ios
//
//  Created by An Vu Gia on 28/07/2023.
//

import Foundation
import SwiftUI
import MapKit
struct locationItem: Identifiable,Decodable {
    var id: Int
    var name: String
    var imageName: String
    var content : String
    var latitude: Double
    var longitude: Double
    var rating: Double
    var isFavorite: Bool
    var image: Image {
        Image(imageName)
    }
    func getLocation() -> CLLocationCoordinate2D {
        return
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    mutating func setFavorite(favoriteState: Bool){
        isFavorite = favoriteState
    }
    
}
