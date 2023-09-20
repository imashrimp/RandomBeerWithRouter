//
//  ViewController.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import UIKit
import SnapKit
import Kingfisher


class ViewController: UIViewController {
    
    let beerImageView = {
        let view = UIImageView()
        view.backgroundColor = .darkGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let showBeerButton = {
        let view = UIButton()
        view.backgroundColor = .systemOrange
        view.setTitle("새 맥주 보기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
        view.titleLabel?.font = .systemFont(ofSize: 35, weight: .bold)
        return view
    }()
    
    let viewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configure()
        setConstraints()
        bind()
    }
    
    
    
    @objc func showBeerButtonTapped() {
        viewModel.request()
    }
    
    func bind() {
        viewModel.beer.bind { myBeer in
            guard
                let urlString = myBeer.imageURL,
                let url = URL(string: urlString) else {
                self.beerImageView.image = UIImage(systemName: "wineglass")
                return
            }
            self.beerImageView.kf.setImage(with: url)
        }
    }
    
    func configure() {
        view.addSubview(beerImageView)
        view.addSubview(showBeerButton)
        
        showBeerButton.addTarget(self, action: #selector(showBeerButtonTapped), for: .touchUpInside)
    }
    
    func setConstraints() {
        beerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(250)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        showBeerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}

