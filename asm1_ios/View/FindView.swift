//
//  FindView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 31/07/2023.
//

import SwiftUI

struct FindView: View {
    var locations : [locationItem]
    var favoriteLocation : [locationItem]
    @State var searchText = ""
    @State private var selectedRating : Int = 0
    var body: some View {
        NavigationStack{
            Picker("Rating Filter", selection: $selectedRating){
                Text("All").tag(0)
                Text("3 Stars").tag(3)
                Text("4 Stars").tag(4)
                Text("Favorites").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
            
            List (searchResults, id: \.id) { location in
                NavigationLink(destination: DetailViewCard(locationItem: location,favoriteLocation: favoriteLocation), label: {
                    VStack {
                        Spacer()
                        Image(location.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 50)
                            .shadow(radius: 10)
                        Spacer()
                        HStack {
                            Spacer()
                            Text(location.name)
                                .font(.body)
                            
                            Spacer()
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                                Text(String(format: "%.1f", location.rating))
                                    .padding(.trailing, 10)
                            }
                        }.background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 10)
                            .padding()
                    }
                })
            }.searchable(text: $searchText)
        }
    }
    var searchResults: [locationItem] {
        let filteredResult : [locationItem]
        if(selectedRating == 0){
            filteredResult = locations
        } else if (selectedRating == 3){
            filteredResult = locations.filter { $0.rating >= 3.0 && $0.rating < 4.0}
        } else if (selectedRating == 4){
            filteredResult = locations.filter { $0.rating >= 4.0 && $0.rating < 5.0}
        } else {
            filteredResult = favoriteLocation
        }
            if searchText.isEmpty {
                return filteredResult
            } else {
                return filteredResult.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
            }
        }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView(locations: locations, favoriteLocation: favLocation)
    }
}
