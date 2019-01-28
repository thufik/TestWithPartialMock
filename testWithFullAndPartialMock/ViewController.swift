//
//  ViewController.swift
//  testWithFullAndPartialMock
//
//  Created by EquipeSuporteAplicacao on 6/4/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

public enum NetworkResult{
    case success
    case error
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeRequest(_ sender: UIButton) {
        let url = URL(string: "http://localhost:8080/login")!
        let session = URLSession.shared
        
        let manager = NetworkManager(session: session)
        
        manager.loadData(from: url) { (result) in
            switch result{
            case .success :
                print("sucesso")
            case .error:
                print("erro")
            }
        }
    }
}

