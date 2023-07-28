//
//  DetailViewCard.swift
//  asm1_ios
//
//  Created by An Vu Gia on 28/07/2023.
//

import SwiftUI
import MapKit
struct DetailViewCard: View {
    var locationItem: locationItem
    
    var body: some View {
        ScrollView{
            ZStack {
                Image(locationItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .frame(width: 360, height: 350)
                    
                Text(locationItem.name)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding([.leading, .trailing], 70)
                    .padding([.top, .bottom], 5)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10) 
                    .frame(width: 300, height: 400, alignment: .bottomLeading)
            }
            VStack (alignment: .leading) {
                Text("About destination")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding([.top], 20)
               

                Text(locationItem.content)
                    .foregroundColor(.black)
                    .font(.body)
                    .padding([.top],1)


            }
            .frame(width: 350, height: .none, alignment: .topLeading)
            .background(Color.red)
            MapView(coordinate: locationItem.getLocation())
                .frame( width: 350, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
                .padding([.top],20)
            HStack{
                Button(action: {
                            // Code to execute when the button is tapped
                            print("Button tapped!")
                        }) {
                            Text("Tap Me!") // Text inside the button
                                .padding() // Add some padding around the text
                                .foregroundColor(.white) // Text color
                                .background(Color.green) // Background color of the button
                                .cornerRadius(10) // Rounded corners for the button
                        }
            }

        }

    }
}

struct DetailViewCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCard(locationItem: locations[0])
    }
}
