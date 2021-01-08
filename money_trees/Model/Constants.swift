//
//  Constants.swift
//  money_trees
//
//  Created by Andrew Liu on 1/7/21.
//

import Foundation

var baseUrl = "https://moneytreesapi.herokuapp.com" //"http://127.0.0.1:5000"
var incomeUrl = baseUrl + "/income/1"
var utilityUrl = baseUrl + "/utility/1"
var foodUrl = baseUrl + "/food/1"
var transportUrl = baseUrl + "/transportation/1"
var subUrl = baseUrl + "/subscriptions/1"
var otherUrl = baseUrl + "/other/1"
var totalUrl = baseUrl + "/total/1"

var URLS = [incomeUrl, utilityUrl, foodUrl, transportUrl, subUrl, otherUrl, totalUrl]

enum t: Int {
    case income, utility, food, transport, sub, other, total
}

var BUDGET_TYPES = ["income", "utility", "food", "transport", "sub", "other", "total"]
