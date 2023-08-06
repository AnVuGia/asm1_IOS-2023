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

import SwiftUI
import MapKit
struct MapView: View {
    let locationItem : locationItem
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [locationItem]){
            location in
            MapMarker(coordinate: locationItem.getLocation(), tint: Color.red)
        }
            .onAppear{
                region = MKCoordinateRegion(
                    center: locationItem.getLocation(), span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
                )
            }
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
