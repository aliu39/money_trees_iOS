//
//  Feed.swift
//  money_trees
//
//  Created by Andrew Liu on 1/7/21.
//

import Foundation

class DataFeed: ObservableObject {
    @Published var data: [BudgetData?] = [nil, nil, nil, nil, nil, nil, nil]
    
    init() {
//        loadDataFeeds()
    }
    
    func loadDataFeeds() {
        for i in 0..<BUDGET_TYPES.count {
            if let url = URL(string: URLS[i]) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    let parsedData = self.parseAPIResponse(data: data, response: response, error: error)
                    if var budgetData = parsedData {
                        budgetData.t = BUDGET_TYPES[i]
                        self.data[i] = budgetData
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
        print("PARSING....\n")
        var json: Any = [:]
        do {
            var json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print("JSON PARSING FAILED")
        }
        
        do {
            if let JSON = json as? [String: Any] {
                if let names = JSON["data"] as? String {
                    var categNames = names.components(separatedBy: ", ")
                    var response = BudgetData()
                    
                    for name in categNames {
                        response.categNames.append(name)
                        if let val = JSON[name] as? [Float] {
                            response.categories.append(val)
                        }
                    }
                    print("PARSING SUCCEEDED\n")
                    return response
                }
            }
        } catch {
            return nil
        }
        return nil
    }
}
