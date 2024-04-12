////
////  MapKitView.swift
////  final-project
////
////  Created by Anvitha Lakshmisha on 4/12/24.
////
//
//import SwiftUI
//import MapKit
//
//struct VisitedLocation: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}
//
//struct MapKitView: View {
//    @State private var visitedLocations: [VisitedLocation] = [
//        VisitedLocation(name: "Location 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
//        VisitedLocation(name: "Location 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
//        // Add more visited locations here...
//    ]
//    
//    var body: some View {
//        Map(coordinateRegion: .constant(getCoordinateRegion()), annotationItems: visitedLocations) { location in
//            MapPin(coordinate: location.coordinate, tint: .red)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//    
//    private func getCoordinateRegion() -> MKCoordinateRegion {
//        guard let initialLocation = visitedLocations.first else {
//            return MKCoordinateRegion()
//        }
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        return MKCoordinateRegion(center: initialLocation.coordinate, span: span)
//    }
//}
//
//#Preview {
//    MapKitView()
//}
//
//
////import SwiftUI
////import MapKit
////
////struct ContentView: View {
////    @State private var locationName: String = ""
////    @State private var coordinates: CLLocationCoordinate2D?
////    @State private var errorMessage: String?
////    
////    var body: some View {
////        VStack {
////            TextField("Enter location name or address", text: $locationName)
////                .padding()
////                .textFieldStyle(RoundedBorderTextFieldStyle())
////            
////            Button("Search") {
////                coordinates = nil
////                errorMessage = nil
////                geocodeLocation()
////            }
////            .padding()
////            .foregroundColor(.white)
////            .background(Color.blue)
////            .cornerRadius(8)
////            
////            if let errorMessage = errorMessage {
////                Text(errorMessage)
////                    .foregroundColor(.red)
////                    .padding()
////            }
////            
////            if let coordinates = coordinates {
////                Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
////                    .padding()
////            }
////        }
////        .padding()
////    }
////    
////    private func geocodeLocation() {
////        let geocoder = CLGeocoder()
////        geocoder.geocodeAddressString(locationName) { placemarks, error in
////            if let error = error {
////                errorMessage = error.localizedDescription
////                return
////            }
////            
////            if let placemark = placemarks?.first {
////                coordinates = placemark.location?.coordinate
////            } else {
////                errorMessage = "Location not found"
////            }
////        }
////    }
////}
////
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView()
////    }
////}
