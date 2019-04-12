//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Admin on 12/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

class CommentNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetCommentResponse) ->()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkServise.shared.getData(url: url) { (json) in
            do {
                let response = try GetCommentResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
