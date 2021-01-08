//
//  DataView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct DataView: View {
    var values: [Float]
    var category: String
    var budgetType: String
    var sum: Double{
        var s=0.0
        for num in (values) {
            s = s+Double(num)
        }
        return s
    }
    var highmon: String{
        var h=0.0
        var hm=0
        var m=0
        for num in (values) {
            if(Double(num)>h){
                h=Double(num)
                hm=m
            }
            m+=1
        }
        return monthToStr(hm)
    }
    var topt: String{
        if(budgetType=="income"){
            return "You earned"
        }
        else if(budgetType=="utility" || budgetType=="sub"){
            return "You paid"
        }
        else if(budgetType=="food" || budgetType=="transport" || budgetType=="other" || budgetType=="total"){
            return "You spent"
        }
        return ""
    }
    var mont: String{
        if(budgetType=="income"){
            return "You earned the most in"
        }
        else if(budgetType=="utility" || budgetType=="sub"){
            return "You paid the most in"
        }
        else if(budgetType=="food" || budgetType=="transport" || budgetType=="other" || budgetType=="total"){
            return "You spent the most in"
        }
        return ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.title).foregroundColor(Color.orange).multilineTextAlignment(.leading)
            Text("")
            Text(topt).foregroundColor(Color.orange)
            Text("$"+String(sum)).font(.title).foregroundColor(Color.green)
            Text("This Year").foregroundColor(Color.orange)
            Text("")
            Text(mont).foregroundColor(Color.orange)
            Text(highmon).font(.title).foregroundColor(Color.green)
//            Text("Start date: " + "").foregroundColor(Color.orange)
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(values: [333,224,500,230], category:"job", budgetType: "income")
    }
}
