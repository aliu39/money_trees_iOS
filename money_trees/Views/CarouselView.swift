//
//  CarouselView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct CarouselView: View {
    var budgets: [BudgetData]
    
    init(data: [BudgetData?]) {
        self.budgets = []
        for entry in data {
            if let budget = entry {
                self.budgets.append(budget)
            } else {
                self.budgets.append(BudgetData())
            }
        }
        if (self.budgets.isEmpty) {
            print("empty data")
            self.budgets.append(BudgetData()) //dummy entry so ForEach doesn't crash
        }
    }
    
    var body: some View {
        TabView() {
            ForEach(budgets) { entry in
                HStack {
                    Spacer()
                    VStack {
                        Text(entry.t.uppercased())
                            .font(.largeTitle)
                        ForEach (0..<entry.categories.count) { i in
                            DataView(values: entry.categories[i], category: entry.categNames[i], budgetType: entry.t)
                                .padding(.bottom)
                            ChartsView(arr: entry.categories[i])
                        }
                    }
                    Spacer()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

//struct CarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarouselView(data: SAMPLE_DATA)
//    }
//}
