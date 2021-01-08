//
//  ChartsView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI
//import Charts

struct ChartsView: View {
    var arr: [Float]
    var body: some View {
        ZStack {
            BarChart(d: arr)
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
        Text("")
        VStack{
            ForEach(0..<data.count) { month in
                HStack {
                    Text(monthToStr(month))
                          .frame(width: 40, alignment: .trailing).foregroundColor(Color.orange)
                    Rectangle()
                         .fill(Color.green)
                         .frame(width: CGFloat(((max == 0) ? 0 : 140 * CGFloat(data[month] / max))), height: 5.0)
                    
                    
                    Spacer()
                    Text("$"+String(data[month])).foregroundColor(Color.orange)
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
