//
//  ViewNutritions.swift
//  healthKitLogger WatchKit Extension
//
//  Created by Klaus-Dieter Reiners on 17.03.22.
//

import SwiftUI
import healthKitPackage

struct ViewEntries: View {
    @EnvironmentObject var addendumViewModel: AddendumModel
    var addendumTypeName: String!
    var body: some View {
        List(addendumViewModel.items.filter({ $0.addendum2addendumtype?.name == addendumTypeName }), id: \.self) { item in
            VStack(alignment: .leading, spacing: 3, content: {
                VStack(alignment: .leading, spacing: 3, content: {
                    Text(BaseServices.standardDateFormatter.string(from: item.timestamp!))
                        .font(.body)
                        .foregroundColor(Color.green)
                    Text(item.name ?? "unknown")
                        .font(.body)
                })
            })
        }
        .navigationTitle("List of \(addendumTypeName)s")
    }
}

struct ViewNutritions_Previews: PreviewProvider {
    static var previews: some View {
        ViewEntries()
    }
}
