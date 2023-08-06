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

struct DashboardView: View {
   var locations : [locationItem]
    
    var body: some View {
        let randomNum = Int.random(in: 0...locations.count-1)
        NavigationStack {
            ZStack {
                Color("background")
                ScrollView{
                    Text("Suggestion")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .leading)
                    
                        .padding([.top,.leading], 10)
                    
                    NavigationLink(destination: DetailViewCard(locationItem: locations[randomNum]), label:
                                    {
                        ZStack
                        {
                            Image(locations[randomNum].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width-20, height: 230)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .padding()
                            VStack {
                                HStack {
                                    Text(locations[randomNum].name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    Spacer()
                                }
                                    
                                HStack() {
                                    Image(systemName:"star.fill")
                                        .foregroundColor(Color.yellow)
                                    Text(String(format: "%.1f", locations[randomNum].rating))
                                    Spacer()
                                }
                                
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width-90, height: 300, alignment: .bottomLeading)
                        }.frame(width: UIScreen.main.bounds.width-20, height: 300)
                        
                        
                    }
                    )
                    
                    
                    
                    Text("Popular places")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .leading)
                        .padding()
                        .padding([.leading], 10)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(locations, id: \.id) { location in
                                NavigationLink(destination: {DetailViewCard(locationItem: location)},
                                               label: {
                                    locationRow(locationItem: location)
                                        .padding()
                                }
                                )
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(locations: locations)
    }
}
    
