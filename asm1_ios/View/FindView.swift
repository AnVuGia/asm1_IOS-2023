//
//  FindView.swift
//  asm1_ios
//
//  Created by An Vu Gia on 31/07/2023.
//

import SwiftUI

struct FindView: View {
    var locations : [locationItem]
    var body: some View {
        NavigationStack{
            List (locations, id: \.id) { location in
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
            }
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView(locations: locations)
    }
}
