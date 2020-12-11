//
//  ViewController.swift
//  GenericsDecodableAndEncodableJSON
//
//  Created by X901 on 11/08/2018.
//  Copyright © 2018 X901. All rights reserved.
//

import Foundation

protocol GenericRESTClient {
    func getGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ())
    func postGenericData<T:Encodable>(urlString: String, parameter: T, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

extension GenericRESTClient {

         func getGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data:", error)
                return
            }
            
            
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            }.resume()
    }
    
    func postGenericData<T:Encodable>(urlString: String, parameter: T, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonBody = try JSONEncoder().encode(parameter)
            
            request.httpBody = jsonBody
            
            
            
            
            
        } catch let jsonErr {
            print("Failed to encode json:", jsonErr)
        }
        
        
        let session = URLSession.shared
        _ = session.dataTask(with: request) { (data,response, error) in
            
        
            
            completion(data,response, error)

            

            
            }.resume()
        
    }

}






