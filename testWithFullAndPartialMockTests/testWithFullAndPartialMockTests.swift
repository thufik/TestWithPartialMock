//
//  testWithFullAndPartialMockTests.swift
//  testWithFullAndPartialMockTests
//
//  Created by EquipeSuporteAplicacao on 6/4/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import XCTest
@testable import testWithFullAndPartialMock

class testWithFullAndPartialMockTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testResquestSuccessfull() {
//
//        let data = Data(bytes: [0,1,1])
//        let session = URLSessionMock(data: data, error: nil)
//        let manager = NetworkManager(session: session)
//        let url = URL(string: "http://localhost:8080/login")!
//
//        manager.loadData(from: url) { (result) in
//            XCTAssertTrue(result == .success)
//        }
//    }
    
    func testRequestSuccessfull(){
        let fakeSession = NetworkSessionMock()
        let manager = NetworkManager(session: fakeSession)
        let url = URL(string: "http://localhost:8080/login")!
        
        manager.loadData(from: url) { (result) in
            XCTAssertTrue(result == .success)
        }
    }
    
}
