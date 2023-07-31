//
//  NavigationView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 28/07/2023.
//

import SwiftUI

struct NavigationView: View {
   var locations : [locationItem]
    
    var body: some View {
        let randomNum = Int.random(in: 0...locations.count-1)
        NavigationStack {
            ScrollView{
                Text("Suggestion")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .leading)
                
                    .padding([.top,.leading], 10)
                
                NavigationLink(destination: DetailViewCard(locationItem: locations[randomNum],favoriteLocation: favLocation), label:
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
                            NavigationLink(destination: {DetailViewCard(locationItem: location, favoriteLocation: favLocation)},
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

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(locations: locations)
    }
}
	
