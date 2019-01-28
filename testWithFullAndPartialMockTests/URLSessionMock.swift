//
//  URLSessionMock.swift
//  testWithFullAndPartialMockTests
//
//  Created by EquipeSuporteAplicacao on 6/4/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Foundation
@testable import testWithFullAndPartialMock

class URLSessionMock: URLSession {
    typealias Completion = (Data?, URLResponse?, Error?) -> Void
    var data : Data?
    var error : Error?
    
    init(data : Data? = nil, error : Error? = nil) {
        self.data = data
        self.error = error
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        
        return URLSessionDataTaskMock(closure: {
            completionHandler(data, nil, error)
        })
    }
}

class URLSessionDataTaskMock : URLSessionDataTask{
    private let closure : () -> Void
    
    init(closure : @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        self.closure()
    }
}

class NetworkSessionMock : NetworkSession{
    func loadData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(Data(bytes: [0,101,1]),nil,nil)
    }
}
