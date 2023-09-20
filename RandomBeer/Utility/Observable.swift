//
//  Observable.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/20.
//

import Foundation

class Observable<T> {
    
    var lister: ((T) -> Void)?
    
    var value: T {
        didSet {
            lister?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(completion: @escaping (T)-> Void) {
        completion(value)
        lister = completion
    }
}
