//
//  ViewController.swift
//  random
//
//  Created by DanBurkhardt on 07/02/2020.
//  Copyright (c) 2020 DanBurkhardt. All rights reserved.
//

import UIKit
import random_swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(Random.word)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

