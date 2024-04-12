//
//  TripeView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/10/24.
//

import Foundation
import SwiftUI


struct Trip: Identifiable {
    let id = UUID()
    let thumbnail: String
    let title: String
    let location: String
    let startDate: Date
    let endDate: Date
}

struct TripsView: View {
    @State private var trips: [Trip] = [
        Trip(thumbnail: "trip1", title: "Trip to Paris", location: "Paris, France", startDate: Date(), endDate: Date()),
        Trip(thumbnail: "trip2", title: "Weekend getaway", location: "Beach, USA", startDate: Date(), endDate: Date())
        // Add more trips here...
    ]
    @State private var editTripNavigation: Trip?
    @State private var isEditMode = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(trips) { trip in
                    NavigationLink(destination: TripDetailView(trip: trip)) {
                        TripRow(trip: trip)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            // Delete action
                            deleteTrip(trip)
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                        
                        Button(action: {
                            // Edit action
                            editTrip(trip)
                        }) {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.blue)
                    }
                    
                }
            }
            .navigationTitle("Trips")
            .navigationBarItems(trailing: addButton)

        }
    }
    
    private func deleteTrip(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips.remove(at: index)
        }
    }
    
    private func editTrip(_ trip: Trip) {
        editTripNavigation = trip
        isEditMode = true
        print(trip)
    }
    
    var addButton: some View {
        NavigationLink(destination: AddTripView()) {
            Image(systemName: "plus")
        }
    }
}

struct TripRow: View {
    let trip: Trip
    
    var body: some View {
        HStack {
            Image(trip.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(trip.title)
                    .font(.headline)
                Text(trip.location)
                    .foregroundColor(.secondary)
                Text("\(trip.startDate, formatter: DateFormatter.shortDate) - \(trip.endDate, formatter: DateFormatter.shortDate)")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct TripDetailView: View {
    let trip: Trip
    
    var body: some View {
        VStack {
            Text(trip.title)
                .font(.title)
            Text(trip.location)
                .foregroundColor(.secondary)
            Text("\(trip.startDate, formatter: DateFormatter.shortDate) - \(trip.endDate, formatter: DateFormatter.shortDate)")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle(trip.title)
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}


#Preview {
    TripsView()
}
