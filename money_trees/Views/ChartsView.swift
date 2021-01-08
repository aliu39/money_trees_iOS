//
//  ChartsView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI
import Charts

struct ChartsView: View {
    
    var entry: BudgetData
    var range = 0..<1
    init(entry: BudgetData) {
        self.entry = entry
        self.range = 0..<entry.categories.count
    }
    
    var body: some View {
        VStack {
            ForEach(self.range) { i in
                BarChart(d: entry.categories[i])
            }
        }
    }
}

struct BarChart: View {
    var data: [Float]
    var max: Float
    init(d: [Float]) {
        data = d
        if let M = d.max() {
            max = M
        }
        else {
            max = 0
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0..<data.count) { month in
                VStack {
                  Spacer()
                  Rectangle()
                    .fill(Color.green)
                    .frame(width: 20, height: ((max == 0) ? 0 : 400 * CGFloat(data[month] / max)))
                  Text(monthToStr(month))
                    .font(.footnote)
                    .frame(height: 20)
                }
            }
        }
    }
}

//struct ChartsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartsView(entry: SAMPLE_DATA[0])
//    }
//}
