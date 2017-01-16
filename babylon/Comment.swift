//
//  Comments.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

public struct Comment {
    let body: String
    let email: String
    let id: Int
    let name: String
    let postId: Int
    
    init?(_ dictionary: [String: Any]) {
        if let body = dictionary["body"] as? String {
            self.body = body
        } else {
            return nil
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        } else {
            return nil
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        } else {
            return nil
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        } else {
            return nil
        }
        
        if let postId = dictionary["postId"] as? Int {
            self.postId = postId
        } else {
            return nil
        }
    }
}

extension Comment: Equatable {
    public static func ==(x: Comment, y: Comment) -> Bool {
        return x.body == y.body &&
            x.email == y.email &&
            x.id == y.id && 
            x.name == y.name && 
            x.postId == y.postId
    } 
}

extension Comment: Hashable {
    public var hashValue: Int {
        return body.hashValue ^ 
            email.hashValue ^ 
            id.hashValue ^ 
            name.hashValue ^ 
            postId.hashValue
    } 
}
