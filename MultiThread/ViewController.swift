//
//  ViewController.swift
//  MultiThread
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 baoxinbei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumlabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            print("Timer Thread: \(Thread.current)")
            self.countLabel.text = "\(self.count)"
            }
    }

    @IBAction func sum(_ sender: Any) {
        var sum = 0
        
        DispatchQueue.global().async {
            print("Sum Thread: \(Thread.current)")
            for i in 1...99999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumlabel.text = "\(sum)"

            }
        }
        
    }
    
}

