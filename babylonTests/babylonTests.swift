//
//  babylonTests.swift
//  babylonTests
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import XCTest
@testable import babylon

class babylonTests: XCTestCase {
    
    var postsTableVC: PostsTableViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        postsTableVC = storyboard.instantiateViewController(withIdentifier: "PostTableVC") as? PostsTableViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let jsonTest = ["body":"Test body","title":"Test title","id": 1,"userId": 2] as [String : Any]
        let post = Post(jsonTest)
        
        XCTAssertEqual(post?.body, "Test body")
        XCTAssertEqual(post?.title, "Test title")
        XCTAssertEqual(post?.id, 1)
        XCTAssertEqual(post?.userId, 2)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.postsTableVC?.fetchData()
        }
    }
    
}
