//
//  FeatureView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/7/21.
//

import SwiftUI

struct FeatureView: View {
    var entry: BudgetData?
    var body: some View {
        VStack(alignment: .leading) {
            if let entry = self.entry {
                Text(entry.t.uppercased())
                    .font(.largeTitle)
                ForEach (0..<entry.categories.count, id: \.self) { i in
                    DataView(values: entry.categories[i], category: entry.categNames[i], budgetType: entry.t)
                        .padding(.bottom)
                    ChartsView(arr: entry.categories[i])
                }
            } else {
                Text("no data")
            }
        }
    }
}

//struct FeatureView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeatureView()
//    }
//}
