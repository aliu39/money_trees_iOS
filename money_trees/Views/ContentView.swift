//
//  ContentView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct ContentView: View {
//    @ObservedObject var dataFeed = DataFeed()
    var body: some View {
        NavigationView {
            List {
                CarouselView(data: []) //Array(dataFeed.data))
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
