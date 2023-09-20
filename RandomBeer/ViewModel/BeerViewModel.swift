//
//  BeerViewModel.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/20.
//

import Foundation

final class BeerViewModel {
    
    var beer = Observable(value: Beer(id: 0, name: "", description: "", imageURL: nil))
    
    func request() {
        Network.shared.callRequestConvertible(type: MyBeer.self, api: .random) { response in
            switch response {
            case .success(let success):
                dump(success)
                guard let myBeer = success.first else { return }
                self.beer.value = myBeer
            case .failure(let failure):
                print(failure.errorDescription)
            }
        }
    }
}
