//
//  ContentView.swift
//  SweetyMemories
//
//  Created by Tran Dinh Hoang Huy on 2020/04/24.
//  Copyright © 2020 KakaHoangHuy. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @ObservedObject var networkManager = NetworkManager()
    
    var updateButton: some View {
        Button(action: { self.networkManager.loadDataNormal() }) {
            Image(systemName: "arrow.clockwise")
                .imageScale(.large)
                .accessibility(label: Text("Update!"))
                .padding()
        }
    }
    
    var body: some View {
        
    NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading ...")
                } else {
                    List(networkManager.movies.results) { movie in
                        NavigationLink(destination: MovieDetails(movie: movie)){
                            MovieRow(movie: movie)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: updateButton)
            .navigationBarTitle(Text("Movies"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
