//
//  AlamoFireApiService.swift
//  Lesson10
//
//  Created by Thomas Vandegriff on 2/26/19.
//  Copyright © 2019 Make School. All rights reserved.
//

    /*** AlamoFireApiService.swift is an API Service client designed to fetch, post and process data to and from the JSONPlaceholder web service:
 
        - Using Alamofire
            https://github.com/Alamofire/Alamofire
    ***/

import Foundation
import Alamofire

class AlamoFireApiService {
    // TODO: Create a function that implements a POST request using Using Alamofire
    
    func getRequest() {
        
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        
        AF.request(endpoint).responseJSON { response in
            // handle response
            guard response.result.error == nil else {
                print("error calling the endpoint")
                print(response.result.error?.localizedDescription)
                return
            }
            
            guard let json = response.result.value as? [String:Any] else {
                print("Error: \(response.result.error)")
                return
            }
            
            guard let todoTitle = json["title"] as? String else {
                print("couldn't find title")
                return
            }
            print("The title is: " + todoTitle)
            
        }
    }
    
    func postRequest() {
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos"
        let Parameters = ["title": "Super Cool Post", "completed": 0, "userId": 8] as [String : Any]
        
        AF.request(endpoint, method: .post, parameters: Parameters).responseJSON { response in
            print(response)
        }
    }
    
    func deleteRequest() {
        let endpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(endpoint, method: .delete).responseJSON { response in
            print(response)
        }
    }
}
