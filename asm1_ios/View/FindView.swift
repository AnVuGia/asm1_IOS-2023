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

struct FindView: View {
     var locations : [locationItem]
    @State var searchText = ""
    @State private var selectedRating : Int = 0
    var body: some View {
        NavigationStack{
            ZStack{
                Color("background")
                VStack{
                    Picker("Rating Filter", selection: $selectedRating){
                        Text("All").tag(0)
                        Text("3 Stars").tag(3)
                        Text("4 Stars").tag(4)
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    List (searchResults, id: \.id) { location in
                        NavigationLink(destination: DetailViewCard(locationItem: location), label: {
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
                                        .foregroundColor(Color.black)
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
            filteredResult = locations
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
        FindView(locations: locations)
    }
}
