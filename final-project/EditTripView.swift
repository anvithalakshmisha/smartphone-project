//
//  EditTripView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/12/24.
//

import SwiftUI

struct EditTripView: View {
    @State private var thumbnailImage: UIImage?
    @State private var location: String
    @State private var startDate: Date
    @State private var endDate: Date
    
    var trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
        _location = State(initialValue: trip.location)
        _startDate = State(initialValue: trip.startDate)
        _endDate = State(initialValue: trip.endDate)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = thumbnailImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding()
                } else {
                    Button(action: {
                        // Show image picker
                    }) {
                        Text("Add Image")
                    }
                    .padding()
                }
                
                TextField("Location", text: $location)
                    .padding()
                
                DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    .padding()
                
                DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                    .padding()
                
                Button(action: {
                    // Update trip action
                    updateTrip()
                }) {
                    Text("Update Trip")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Edit Trip", displayMode: .inline)
        }
    }
    
    func updateTrip() {
        // Perform action to update the trip with the provided details
        // You can access the values of thumbnailImage, location, startDate, and endDate here
    }
}

//#Preview {
//    EditTripView(trip: <#T##Trip#>)
//}
