//
//  APIResponse.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import Foundation

struct BudgetData: Identifiable {
    var id = UUID()
    var t: String
    var categNames: [String]
    var categories: [[Float]]
    init() {
        t = "(unknown)"
        categNames = [String]()
        categories = [[Float]]()
    }
}

//struct ApiResponse { //}: Codable {
//    var numResults: Int
//    var data: [BudgetData]?
//
//    init () {
//        numResults = 0
//        data = nil
//    }
//}

//let SAMPLE_DATA = [
//    BudgetData(categ:"savings", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380, 475, 460, 370, 401, 459, 470], ls:[]),
//    BudgetData(categ:"food spendings", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380, 475, 460, 370, 401, 459, 470], ls:[]),
//    BudgetData(categ:"income", date:"1/1/20", vs:[662, 658, 646, 655, 662, 651, 651, 662, 666, 653, 733, 746], ls:[]),
//    BudgetData(categ:"budget", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380, 475, 460, 370, 401, 459, 470], ls:[])
//]
