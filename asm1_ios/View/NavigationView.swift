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
                Text("Suggestion")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width, height: nil, alignment: .leading)
                    .padding()
                    .padding([.leading], 10)
                
                NavigationLink(destination: DetailViewCard(locationItem: locations[randomNum]), label:
                    {
                    ZStack
                        {
                        Image(locations[randomNum].imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width-20, height: 250)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .padding()
                    Text(locations[randomNum].name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width-50, height: 300, alignment: .bottomLeading)
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

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(locations: locations)
    }
}
	
