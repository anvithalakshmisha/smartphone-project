//
//  TripDetailView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/12/24.
//

import SwiftUI

struct TripDetailView: View {
    let trip: Trip
    
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            Image("italy")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .offset(y: -150)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .center) {
                Text(trip.title)
                    .font(.title)
                HStack {
                    Text(trip.location)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("\(trip.startDate, formatter: DateFormatter.shortDate) - \(trip.endDate, formatter: DateFormatter.shortDate)")
            }
            .padding()
            
            Spacer()
        }
            
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}


//#Preview {
//    TripDetailsView()
//}
