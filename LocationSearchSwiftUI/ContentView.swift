//
//  ContentView.swift
//  LocationSearchSwiftUI
//
//  Created by 沈清昊 on 7/2/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var search: String = ""
    @EnvironmentObject var localSearchService: LocalSearchService
    
    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    localSearchService.search(query: search)
            }.padding()
            if localSearchService.landmarks.isEmpty{
                Text("Please input your places.")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 2))
            } else{
                LandmarkListView()
            }
            
            Map(coordinateRegion: $localSearchService.region, showsUserLocation: true, annotationItems: localSearchService.landmarks){ landmark in
                MapAnnotation(coordinate: landmark.coordinate) {
                    Image(systemName: "mappin")
                        .foregroundColor(localSearchService.landmark == landmark ? .yellow : .red)
                        .scaleEffect(localSearchService.landmark == landmark ? 2 : 1)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(LocalSearchService())
    }
}
