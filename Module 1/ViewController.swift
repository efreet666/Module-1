//
//  ViewController.swift
//  Module 1
//
//  Created by Влад Бокин on 02.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        dataRequest()
    }
    
    //MARK: - use Snapkit
    
    func setupLabel() {
        greetingLabel.text = "Hello world"
        greetingLabel.textAlignment = .center
        view.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    func dataRequest() {
        Networking.fetchData(Networking.URL) { result in
            switch result {
            case .success(let data):
                print(data as Any)
            case .failure(let error):
                if error.localizedDescription == "Response status code was unacceptable: 404." {
                    print("Ошибка 404")
                } else {
                    print("error.localizedDescription")
                }
            }
        }
    }
    
}

