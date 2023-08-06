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
struct DetailViewCard: View {
        @State var locationItem: locationItem
        var body: some View {
            ZStack {
                Color("background")
                ScrollView{
                ZStack {
                    Image(locationItem.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 30))

                    VStack(alignment: .leading) {
                        Text(locationItem.name)
                            .foregroundColor(Color.black)
                            .font(.title)
                            .fontWeight(.bold)
                        HStack {
                            Image(systemName:"star.fill")
                                .foregroundColor(Color.yellow)
                            Text(String(format: "%.1f", locationItem.rating))
                                .foregroundColor(Color.black)
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
                    .foregroundColor(Color("text"))
                    .padding([.top], 20)
                   

                    Text(locationItem.content)
                        .foregroundColor(Color("text"))
                        .font(.body)
                        .padding([.top],1)


                }
                .frame(width: 350, height: .none, alignment: .topLeading)
                            MapView(locationItem: locationItem)
                    .frame( width: 350, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 3)
                    .padding([.top],20)
                HStack{
                    
                        Button("Go to Map!"){
                            let latitude = locationItem.latitude
                            let longitude = locationItem.longitude
                            let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
                            if UIApplication.shared.canOpenURL(url!) {
                                  UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                            }
                            else{
                                  let urlBrowser = URL(string: "https://www.google.co.in/maps/dir/??saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
                                            
                                   UIApplication.shared.open(urlBrowser!, options: [:], completionHandler: nil)
                            }
                        }.padding()
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 4)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)

                    }.padding()
                Spacer()
                
                }
            }.ignoresSafeArea()
            

        }
    
}

struct DetailViewCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewCard(locationItem: locations[0])
    }
}
