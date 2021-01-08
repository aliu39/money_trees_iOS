//
//  CarouselView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct CarouselView: View {
    var data: [BudgetData?]
    var budgets: [BudgetData] {
        var arr: [BudgetData] = []
        for budget in data {
            if let entry = budget {
                arr.append(entry)
            }
        }
        return arr
    }
    var body: some View {
        TabView() {
            ForEach(budgets) { entry in
                HStack {
                    Text(entry.t)
//                    Spacer()
//                    VStack {
//                        DataView(entry: entry)
//                            .padding(.bottom)
////                        ChartsView(entry: entry)
//                    }
//                    Spacer()
                }
            }
        }
        .aspectRatio(3 / 2, contentMode: .fit)
        .tabViewStyle(PageTabViewStyle())
    }
}

//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView(data: SAMPLE_DATA)
//    }
//}
