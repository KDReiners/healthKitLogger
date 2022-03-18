//
//  AddNutrition.swift
//  healthKitLogger WatchKit Extension
//
//  Created by Klaus-Dieter Reiners on 17.03.22.
//

import SwiftUI
import healthKitPackage

struct AddEntry: View {
    @EnvironmentObject var addendumViewModel: AddendumModel
    @EnvironmentObject var addendumTypeViewModel: AddendumTypeModel
    @State var entryText = ""
    @State var addendumTypeName: String!
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 15) {
            TextField("\(addendumTypeName)...", text: $entryText)
            Button(action: {save(entry: entryText)}, label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange)
                    .cornerRadius(15)
                    .disabled(entryText == "")
            })
        }
        .navigationTitle(addendumTypeName)
    }
    private func save(entry: String) -> Void {
        if addendumTypeViewModel.items.filter({ $0.name == addendumTypeName }).count == 0 {
            let addendumType = addendumTypeViewModel.insertRecord()
            addendumType.name = addendumTypeName
            addendumTypeViewModel.items.append(addendumType)
            addendumTypeViewModel.saveChanges()
        }
        let addendumType = addendumTypeViewModel.items.filter( { $0.name == addendumTypeName}).first
        let addendum = addendumViewModel.insertRecord()
        addendum.timestamp = Date()
        addendum.name = entry
        addendum.addendum2addendumtype = addendumType
        addendumViewModel.items.append(addendum)
        addendumViewModel.saveChanges()
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddNutrition_Previews: PreviewProvider {
    static var previews: some View {
        AddEntry(addendumTypeName: "nutrition")
    }
}
