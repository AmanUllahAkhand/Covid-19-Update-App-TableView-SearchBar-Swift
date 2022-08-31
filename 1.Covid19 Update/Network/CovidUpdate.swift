//
//  CovidUpdate.swift
//  1.Covid19 Update
//
//  Created by USER on 19/07/2022.
//

import UIKit

class Covid19Update {
 
    func getCovidUpdate( completion: @escaping (_ success:Model) -> Void) {
        
        let fullUrl = AllApi.COVID_UPDATE
        print(fullUrl)
        var request = URLRequest(url: URL(string: fullUrl)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 120 // 120 sec
        
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let myData = data, error == nil else { return }
            do {
                print(myData)
                let responseModel: Model = try JSONDecoder().decode(Model.self, from: myData )
                DispatchQueue.main.async {
                    completion(responseModel)
                }
            } catch let err {
                print(err)
            }
        }.resume()
         
    } }
