//
//  DataView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct DataView: View {
    var entry: BudgetData
    var entryType: String = "SAVINGS"
    var entryStartingDate: String = "1/1/20"
    var strData: String {
        var res = ""
        for i in 0..<entry.categories.count {
            var mo = 0
            res += entry.categNames[i].uppercased() + "\n"
            for num in entry.categories[i] {
                res += monthToStr(mo) + ": $" + String(num) + "   "
                mo += 1
            }
            res += "\n\n"
        }
        return res
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.t.uppercased())
                .font(.title)
            Text("Start date: " + entryStartingDate)
            Text(strData)
        }
    }
}

//struct DataView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataView(entry: SAMPLE_DATA[0])
//    }
//}
