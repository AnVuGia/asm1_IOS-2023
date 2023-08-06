/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 1
  Author: Vu Gia An
  ID: s3926888
  Created  date: 06/08/2023
  Last modified: 06/08/2023
  Acknowledgement: Acknowledge the resources that you use here. 
*/
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
