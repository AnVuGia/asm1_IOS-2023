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
                    .frame(width: 360, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 30))

                VStack(alignment: .leading) {
                    Text(locationItem.name)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName:"star.fill")
                            .foregroundColor(Color.yellow)
                        Text(String(format: "%.1f", locationItem.rating))
                    }
                }.padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 10)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    .padding()
                .frame(width: UIScreen.main.bounds.width-20, height: 450, alignment: .bottomLeading)
        
                    
            }
            VStack (alignment: .leading) {
                Text("About destination")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding([.top], 20)
               

                Text(locationItem.content)
                    .foregroundColor(Color.black)
                    .font(.body)
                    .padding([.top],1)


            }
            .frame(width: 350, height: .none, alignment: .topLeading)
                        MapView(coordinate: locationItem.getLocation())
                .frame( width: 350, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
                .padding([.top],20)
            HStack{
                Button(action: {
                            // Code to execute when the button is tapped
                            print("Button tapped!")
                        }) {
                            Text("Add to Favorite!") // Text inside the button
                                .padding() // Add some padding around the text
                                .foregroundColor(.white) // Text color
                                .background(Color.pink) // Background color of the button
                                .cornerRadius(10) // Rounded corners for the button
                        }
            
            }
            Spacer()

        }
    }
}

struct DetailViewCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCard(locationItem: locations[0])
    }
}
