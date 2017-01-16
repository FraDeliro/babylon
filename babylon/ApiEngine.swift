//
//  ApiEngine.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

//MARK: - Blocks Typedef
typealias ErrorBlock = ( _ error: NSError) -> ()
typealias ModelBlock = ( _ response: AnyObject) -> ()

class ApiEngine: NSObject {

    //MARK: - Outlets & Variables
    static let shared = ApiEngine()
    let baseUrl = "http://jsonplaceholder.typicode.com/"
    let session = URLSession(configuration: .default)

    //MARK: - Request 
    func request(_ url: URL) -> URLRequest {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        return request
    }

    //MARK: - Queries
    func getPosts(_ accessPoint: String, succedeedBlock: @escaping ModelBlock, errorBlock: @escaping ErrorBlock) {
        let url = URL(string: baseUrl + accessPoint)
        session.dataTask(with: request(url!)) { (data, response, error) in
            if error != nil {
                print(error!)
                errorBlock(error as! NSError)
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                    var posts = [Post]()
                    for dict in parsedData {
                        if let post = Post(dict as! [String: Any]) {
                            posts.append(post)
                        }
                    }
                    succedeedBlock(posts as AnyObject)
                } catch let error as NSError {
                    print(error)
                    errorBlock(error)
                }
            }
        }.resume()
    }

    func getPostsAuthors(_ accessPoint: String, succedeedBlock: @escaping ModelBlock, errorBlock: @escaping ErrorBlock) {
        let url = URL(string: baseUrl + accessPoint)
        session.dataTask(with: request(url!)) { (data, response, error) in
            if error != nil {
                print(error!)
                errorBlock(error as! NSError)
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                    var users = [User]()
                    for dict in parsedData {
                        if let user = User(dict as! [String: Any]) {
                            users.append(user)
                        }
                    }
                    succedeedBlock(users as AnyObject)
                } catch let error as NSError {
                    print(error)
                    errorBlock(error)
                }
            }
        }.resume()
    }

    func getCommentsForPosts(_ accessPoint: String, succedeedBlock: @escaping ModelBlock, errorBlock: @escaping ErrorBlock) {
        let url = URL(string: baseUrl + accessPoint)
        session.dataTask(with: request(url!)) { (data, response, error) in
            if error != nil {
                print(error!)
                errorBlock(error as! NSError)
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                    var comments = [Comment]()
                    for dict in parsedData {
                        if let comment = Comment(dict as! [String: Any]) {
                            comments.append(comment)
                        }
                    }
                    succedeedBlock(comments as AnyObject)
                } catch let error as NSError {
                    print(error)
                    errorBlock(error)
                }
            }
        }.resume()
    }

}
