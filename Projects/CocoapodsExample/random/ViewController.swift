//
//  ViewController.swift
//  random
//
//  Created by DanBurkhardt on 07/02/2020.
//  Copyright (c) 2020 DanBurkhardt. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import random_swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(Random.word)
        let test = RandomConfig().enableWordsForRelease
        print(test)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

