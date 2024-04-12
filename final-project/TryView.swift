//
//  TryView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/12/24.
//

import SwiftUI

//import SwiftUI
import MapKit
//
//struct ContentView: View {
//    @State private var locationName: String = ""
//    @State private var coordinates: CLLocationCoordinate2D?
//    @State private var errorMessage: String?
//
//    var body: some View {
//        VStack {
//            TextField("Enter location name or address", text: $locationName)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//            Button("Search") {
//                coordinates = nil
//                errorMessage = nil
//                geocodeLocation()
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .cornerRadius(8)
//
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .foregroundColor(.red)
//                    .padding()
//            }
//
//            if let coordinates = coordinates {
//                Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
//                    .padding()
//            }
//        }
//        .padding()
//    }
//
//    private func geocodeLocation() {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(locationName) { placemarks, error in
//            if let error = error {
//                errorMessage = error.localizedDescription
//                return
//            }
//
//            if let placemark = placemarks?.first {
//                coordinates = placemark.location?.coordinate
//            } else {
//                errorMessage = "Location not found"
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct TryView: View {
        @State private var locationName: String = ""
        @State private var coordinates: CLLocationCoordinate2D?
        @State private var errorMessage: String?
    
        var body: some View {
            VStack {
                TextField("Enter location name or address", text: $locationName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
    
                Button("Search") {
                    coordinates = nil
                    errorMessage = nil
                    geocodeLocation()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
    
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
    
                if let coordinates = coordinates {
                    Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
                        .padding()
                }
            }
            .padding()
        }
    
        private func geocodeLocation() {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(locationName) { placemarks, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                    return
                }
    
                if let placemark = placemarks?.first {
                    coordinates = placemark.location?.coordinate
                } else {
                    errorMessage = "Location not found"
                }
            }
        }
}

#Preview {
    TryView()
}
