//
//  ViewController.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        Network.shared.callRequest(type: MyBeer.self, api: .single(id: 300)) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
        
    }
}

