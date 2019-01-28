//
//  NetworkManager.swift
//  testWithFullAndPartialMock
//
//  Created by EquipeSuporteAplicacao on 6/4/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class OldNetworkManager {

    var session : URLSession
    
    init(session : URLSession) {
        self.session = session
    }
    
    func loadData(from url: URL, completionHandler : @escaping (NetworkResult) -> Void){
        let task = session.dataTask(with: url) { (result, response, error) in
            if result != nil{
                completionHandler(.success)
            }else{
                completionHandler(.error)
            }
        }
        
        task.resume()
    }
}

class NetworkManager {
    
    var session : NetworkSession
    
    init(session : NetworkSession) {
        self.session = session
    }
    
    func loadData(from url: URL, completionHandler : @escaping (NetworkResult) -> Void){
        session.loadData(with: url) { (data, response, error) in
            if data != nil{
                completionHandler(.success)
            }else{
                completionHandler(.error)
            }
        }
    }
}

protocol NetworkSession{
    func loadData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession : NetworkSession{
    func loadData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let task = dataTask(with: url, completionHandler: { (data, response , error) in
            completionHandler(data, response, error)
        })
        
        task.resume()
    }
 
}
