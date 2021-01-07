//
//  APIResponse.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import Foundation

class BudgetData: Identifiable { //Codable {
    
    enum t: String {
        case savings = "savings" //include source?
        case spendings = "food spendings" //"utility transportation subscription"
        case income = "income"
        case budget = "budget"
    }
    
    var type: t
    var startingDate: String //date of first entry
    var numMonths: Int //num of months of total data
    var values: [Float] //len = months
    var locations: [String] //locations of transactions
    
    init(categ:String, date:String, vs:[Float], ls:[String]) {
        type = t(rawValue: categ) ?? .income
        startingDate = date
        values = vs
        locations = ls
        numMonths = vs.count
    }
    
    enum CodingKeys: String, CodingKey {
        case type
        case startingDate
        case values
        case locations
    }
    
}


class ApiResponse { //}: Codable {
    var numResults: Int
    var data: [BudgetData]?
    
    init () {
        numResults = 0
        data = nil
    }
}

let SAMPLE_DATA = [
    BudgetData(categ:"savings", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380], ls:[]),
    BudgetData(categ:"food spendings", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380], ls:[]),
    BudgetData(categ:"income", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380], ls:[]),
    BudgetData(categ:"budget", date:"1/1/20", vs:[356, 375, 359, 440, 435, 380], ls:[])
]
