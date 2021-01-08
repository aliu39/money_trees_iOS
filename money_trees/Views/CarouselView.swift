//
//  CarouselView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct CarouselView: View {
    @ObservedObject var dataFeed = DataFeed()
    
    var body: some View {
        TabView() {
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.income)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.utility)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.food)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.transport)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.sub)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.other)
                        .padding(.bottom)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    FeatureView(entry: dataFeed.total)
                        .padding(.bottom)
                }
                Spacer()
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
