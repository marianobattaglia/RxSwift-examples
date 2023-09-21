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
    var coldObservable: Observable<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coldObservable = mockColdObservable(element: "This is a cold Observable")
    }
    
    func mockColdObservable(element: String) -> Observable<String> {
        return Observable.create { observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    @IBAction func subscribeToObservable(_ sender: Any) {
        coldObservable!
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
}
