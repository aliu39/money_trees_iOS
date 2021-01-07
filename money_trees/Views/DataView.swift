//
//  DataView.swift
//  money_trees
//
//  Created by Andrew Liu on 1/6/21.
//

import SwiftUI

struct DataView: View {
    var entry: BudgetData
    
    
    var sum: Double{
        var s=0.0
        for num in (entry.values) {
            s = s+Double(num)
        }
        return s
    }
    var highmon: String{
        var h=0.0
        var hm=0
        var m=0
        for num in (entry.values) {
            if(Double(num)>h){
                h=Double(num)
                hm=m
            }
            m+=1
        }
        return monthToStr(hm)
    }
    var topt: String{
        if(entry.type.rawValue=="savings"){
            return "You saved"
        }
        else if(entry.type.rawValue=="food spendings"){
            return "You really loved food and spent"
        }
        else if(entry.type.rawValue=="income"){
            return "You made"
        }
        else if(entry.type.rawValue=="budget"){
            return "Your budget is"
        }
        return ""
    }
    var mont: String{
        if(entry.type.rawValue=="savings"){
            return "You saved the most in"
        }
        else if(entry.type.rawValue=="food spendings"){
            return "You spent the most on food in"
        }
        else if(entry.type.rawValue=="income"){
            return "You made the most in"
        }
        else if(entry.type.rawValue=="budget"){
            return "Your budget is the highest in"
        }
        return ""
    }
    var strData: String {
        var res = ""
        var mo = 0
        for num in (entry.values) {
            res += monthToStr(mo) + ": $" + String(num) + "   "
            mo += 1
        }
        return res
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.type.rawValue.uppercased())
                .font(.title).foregroundColor(Color.orange)
            Text("")
            
            Text(topt).foregroundColor(Color.orange)
            Text("$"+String(sum)).font(.title).foregroundColor(Color.green)
            Text("This Year").foregroundColor(Color.orange)
            
            Text("")
            
            Text(mont).foregroundColor(Color.orange)
            
            
            Text(highmon+"\n").font(.title).foregroundColor(Color.green)
            
            Text("Start date: " + entry.startingDate).foregroundColor(Color.orange)
            Text(strData).foregroundColor(Color.green)
            
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView(entry: SAMPLE_DATA[0])
    }
}
