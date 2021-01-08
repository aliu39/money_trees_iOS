//
//  Constants.swift
//  money_trees
//
//  Created by Andrew Liu on 1/7/21.
//

import Foundation

var baseUrl = "https://moneytreesapi.herokuapp.com" //"http://127.0.0.1:5000"
var incomeUrl = baseUrl + "/income/12"
var utilityUrl = baseUrl + "/utility/12"
var foodUrl = baseUrl + "/food/12"
var transportUrl = baseUrl + "/transportation/12"
var subUrl = baseUrl + "/subscriptions/12"
var otherUrl = baseUrl + "/other/12"
var totalUrl = baseUrl + "/total/12"

var URLS = [incomeUrl, utilityUrl, foodUrl, transportUrl, subUrl, otherUrl, totalUrl]
var BUDGET_TYPES = ["income", "utility", "food", "transport", "sub", "other", "total"]
