//
//  MapView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 28/07/2023.
//

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
