//
//  ViewController.swift
//  ErrorHandlingRxTraining
//
//  Created by Yair Carreno on 8/24/19.
//  Copyright © 2019 Yair Carreno. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.just("My event from Observable")
            .subscribe(onNext:{ element in
                print(element)
            }).disposed(by: disposeBag)
    }
}
