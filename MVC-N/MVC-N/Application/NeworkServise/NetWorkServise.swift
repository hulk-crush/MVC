//
//  NetWorkServise.swift
//  MVC-N
//
//  Created by Admin on 11/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class NetworkServise {
    
    private init() {}
    static let shared = NetworkServise()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
       
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch {
                print(error)
            }
        } .resume()
    }
}
