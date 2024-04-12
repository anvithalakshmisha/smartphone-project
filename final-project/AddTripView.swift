//
//  AddTrip.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/12/24.
//

import SwiftUI

import UIKit

struct AddTripView: View {
    @State private var thumbnailImage: UIImage? = nil
    @State private var location: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType?
    @State private var showActionSheet: Bool = false
    
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
                        showActionSheet = true
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
                    // Add trip action
                    addTrip()
                }) {
                    Text("Add Trip")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Add Image"), buttons: [
                    .default(Text("Take Picture"), action: {
                        sourceType = .camera
                        showImagePicker = true
                    }),
                    .default(Text("Upload from Library"), action: {
                        sourceType = .photoLibrary
                        showImagePicker = true
                    }),
                    .cancel()
                ])
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $thumbnailImage, sourceType: sourceType ?? .photoLibrary)
            }
        }
    }
    
    func addTrip() {
        // Perform action to add the trip with the provided details
        // You can access the values of thumbnailImage, location, startDate, and endDate here
    }
    
    func loadImage() {
        guard let inputImage = thumbnailImage else { return }
        // You can resize, compress, or process the image here if needed
    }
}

#Preview {
    AddTripView()
}
