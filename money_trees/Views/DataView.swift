//
//  DataView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct DataView: View {
    var entry: BudgetData
    var strData: String {
        var res = ""
        var mo = 0
        for num in (entry.values) {
            res += monthToStr(mo) + ": $" + String(num) + "   "
            mo += 1
        }
        return res
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.type.rawValue.uppercased())
                .font(.title)
            Text("Start date: " + entry.startingDate)
            Text(strData)
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(entry: SAMPLE_DATA[0])
    }
}
