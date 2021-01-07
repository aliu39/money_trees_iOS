//
//  CarouselView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct CarouselView: View {
    var data: [BudgetData]
    var body: some View {
        TabView() {
            ForEach(data) { entry in
                VStack {
                    DataView(entry: entry)
                        .padding(.bottom)
                    ChartsView(entry: entry)
                }
            }
        }
        .aspectRatio(3 / 2, contentMode: .fit)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(data: SAMPLE_DATA)
    }
}
