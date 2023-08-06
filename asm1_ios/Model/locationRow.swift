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

struct locationRow: View {
    var locationItem : locationItem
    var body: some View {
        VStack(){
            Image(locationItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding([ .top],15)
                .shadow(radius: 1)
                .frame(width: 290,height: nil, alignment: .center)
            Text(locationItem.name)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .frame(width: 240, height: nil, alignment: .leading)
            HStack() {
                Image(systemName:"star.fill")
                    .foregroundColor(Color.yellow)
                Text(String(format: "%.1f", locationItem.rating))
            }
            .frame(width: 240 ,height: nil, alignment: .leading)
            .padding([.bottom],20)
        }.frame(width: 290, height: 370, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(radius: 10)

                      
            
    }
}

struct locationRow_Previews: PreviewProvider {
    static var previews: some View {
        locationRow(locationItem: locations[0])
    }
}
