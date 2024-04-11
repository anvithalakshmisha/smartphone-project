//
//  HomeView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/10/24.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            TripsView()
                .tabItem {
                    Image(systemName: "airplane")
                    Text("Trips")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo.on.rectangle")
                    Text("Gallery")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}
