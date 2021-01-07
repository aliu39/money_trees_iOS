//
//  Helpers.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import Foundation

func monthToStr(_ month: Int) -> String {
    let ma = Calendar.current.shortMonthSymbols
    return ma[month]
}
