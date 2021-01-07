//
//  ChartsView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct ChartsView: View {
    var entry: BudgetData
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView(entry: SAMPLE_DATA[0])
    }
}
