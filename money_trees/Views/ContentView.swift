//
//  ContentView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                if true {
                    CarouselView(data: SAMPLE_DATA)
                } else {
                    Text("empty")
                }
            }
            .navigationTitle("Money Tree")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
