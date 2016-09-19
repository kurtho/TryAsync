//
//  ViewController.swift
//  TryAsync
//
//  Created by KurtHo on 2016/9/19.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOne = 0
    var numberTwo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        concurrentQueue.async {
            for i in 1...10 {
                self.numberOne += 1
                Thread.sleep(forTimeInterval: 0.1)
                if i == 10 {
                    print("number1 \(self.numberOne) number2 \(self.numberTwo)")
                }
            }
        }
        
        print("dispatch_async1")
        concurrentQueue.async {
            for _ in 1...10 {
                self.numberTwo += 1
            }
        }
        print("dispatch_async2")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

