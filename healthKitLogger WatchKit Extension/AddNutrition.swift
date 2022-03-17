//
//  AddNutrition.swift
//  healthKitLogger WatchKit Extension
//
//  Created by Klaus-Dieter Reiners on 17.03.22.
//

import SwiftUI

struct AddNutrition: View {
    @State var nutritionText = ""
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("Nutrition...", text: $nutritionText)
            Button(action: {}, label: {
                Text("Save")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange)
                    .cornerRadius(15)
                    .disabled(nutritionText == "")
            })
        }
        .navigationTitle("Nutrition")
    }
}

struct AddNutrition_Previews: PreviewProvider {
    static var previews: some View {
        AddNutrition()
    }
}
