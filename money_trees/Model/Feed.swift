//
//  Feed.swift
//  money_trees
//
//  Created by Andrew Liu on 1/7/21.
//

import Foundation

class DataFeed: ObservableObject {
    @Published var income: BudgetData? = nil
    @Published var utility: BudgetData? = nil
    @Published var food: BudgetData? = nil
    @Published var transport: BudgetData? = nil
    @Published var sub: BudgetData? = nil
    @Published var other: BudgetData? = nil
    @Published var total: BudgetData? = nil
    
    init() {
        loadDataFeeds()
    }
    
//    var data: [BudgetData?] {
//        return [self.income, self.utility, self.food, self.transport, self.sub, self.other, self.total]
//    }
    
    func loadDataFeeds() {
        for i in 0..<BUDGET_TYPES.count {
            if let url = URL(string: URLS[i]) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    let parsedData = self.parseAPIResponse(data: data, response: response, error: error)
                    if var budgetData = parsedData {
                        budgetData.t = BUDGET_TYPES[i]
                        DispatchQueue.main.async {
                            switch(i) {
                            case 0: self.income = budgetData
                            case 1: self.utility = budgetData
                            case 2: self.food = budgetData
                            case 3: self.transport = budgetData
                            case 4: self.sub = budgetData
                            case 5: self.other = budgetData
                            case 6: self.total = budgetData
                            default: print("out of bounds idx for BUDGET_TYPES")
                            }
                        }
                    }
                }.resume()
            }
        }
    }
    
    func parseAPIResponse(data: Data?, response: URLResponse?, error: Error?) -> BudgetData? {
        guard error == nil else {
            print("Error: \(error!)")
            return nil
        }
        guard let data = data else {
            print("No data found to be displayed.")
            return nil
        }
        
        return parseJSONData(data)
    }
    
    private func parseJSONData(_ data: Data) -> BudgetData? {
//        print("PARSING....")
        var json: Any = [:]
        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print("JSON PARSING FAILED")
        }
        
        do {
            if let JSON = json as? [String: Any] {
                if let names = JSON["data"] as? String {
                    var categNames = names.components(separatedBy: ", ")
                    var response = BudgetData()
                    
                    for name in categNames {
                        if let val = JSON[name] as? [Float] {
                            response.categNames.append(name)
                            response.categories.append(val)
                        }
                    }
                    print("PARSING SUCCEEDED")
                    return response
                } else {
                    print("'data' val was not a string")
                }
            } else {
                print("json was not a string dict")
            }
        } catch {
            return nil
        }
        return nil
    }
}
