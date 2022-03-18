//
//  ContentView.swift
//  healthKitLogger WatchKit Extension
//
//  Created by Klaus-Dieter Reiners on 14.03.22.
//

import SwiftUI
import healthKitPackage

struct ContentView: View {
    @ObservedObject var addendumViewModel = AddendumModel()
    @ObservedObject var addendumTypeViewModel = AddendumTypeModel()
    var body: some View {
        GeometryReader { reader in
            let rect = reader.frame(in: .global)
            VStack(spacing: 15) {
                HStack(spacing: 25) {
                    NavigationLink(destination: AddEntry(addendumTypeName: "nutrition")
                                    .environmentObject(addendumViewModel)
                                    .environmentObject(addendumTypeViewModel), label: {
                        NavButton(image: "plus", title: "Nutrition", rect: rect, color: .pink)
                    })
                        .buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: AddEntry(addendumTypeName: "medication")
                                    .environmentObject(addendumViewModel)
                                    .environmentObject(addendumTypeViewModel)
                                   , label: {
                    NavButton(image: "cross.case", title: "Medication", rect: rect, color: .blue)
                    })
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: rect.width, alignment: .center)
                HStack(spacing: 25) {
                    NavigationLink(destination: ViewEntries(addendumTypeName: "nutrition")
                                    .environmentObject(addendumViewModel)
                                    .environmentObject(addendumTypeViewModel), label: {
                        NavButton(image: "doc.plaintext", title: "View", rect: rect, color: .pink)
                    })
                        .buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: ViewEntries(addendumTypeName: "medication")
                                    .environmentObject(addendumViewModel)
                                    .environmentObject(addendumTypeViewModel), label: {
                        NavButton(image: "doc.plaintext", title: "View", rect: rect, color: .blue)
                    })
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
        
    
}
struct NavButton: View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width/3, height: rect.width/3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
