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
                        DataView(entry: entry)
                            .padding(.bottom)
                        ChartsView(entry: entry)
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
