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
    let hotObservable =  PublishSubject<Int>()
    var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mockHotObservable()
    }
    
    func mockHotObservable() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.runCount += 1
            print(self.runCount)
            self.hotObservable.on(.next(self.runCount))
        }
    }
    
    @IBAction func subscribeToObservable(_ sender: Any) {
        hotObservable
            .subscribe(onNext: { element in
                print("Hot observable receive: ", element)
            })
            .disposed(by: disposeBag)
    }
}
