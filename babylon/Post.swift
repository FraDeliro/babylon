//
//  Post.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

public struct Post {
    let body: String
    let id: Int
    let title: String
    let userId: Int
    var users = [User]()
    var comments = [Comment]()
    
    init?(_ dictionary: [String: Any]) {
        if let body = dictionary["body"] as? String {
            self.body = body
        } else {
            return nil
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        } else {
            return nil
        }
        
        if let title = dictionary["title"] as? String {
            self.title = title
        } else {
            return nil
        }
        
        if let userId = dictionary["userId"] as? Int {
            self.userId = userId
        } else {
            return nil
        }
    }
}

extension Post: Equatable {
    public static func ==(x: Post, y: Post) -> Bool {
        return x.body == y.body &&
            x.id == y.id &&
            x.title == y.title &&
            x.userId == y.userId
    } 
}

extension Post: Hashable {
    public var hashValue: Int {
        return body.hashValue ^ 
            id.hashValue ^ 
            title.hashValue ^ 
            userId.hashValue
    } 
}
