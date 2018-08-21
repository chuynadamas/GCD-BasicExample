//
//  ViewController.swift
//  gcdApp
//
//  Created by Jesus Cruz Perez on 6/5/18.
//  Copyright © 2018 Jesus Cruz Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var isFreezeLabel: UILabel!
    
    var dwi     : DispatchWorkItem? = nil
    var myDq    : DispatchQueue? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func countAction(_ sender: UIButton) {
        freezeTheApp()
    }
    
    
    func freezeTheApp(){
        for _ in 1...1000000 {
            print("👷🏻‍👷🏻👷🏽👷🏽️👷🏿👷🏿")
        }
        countLabel.text = "We’ve finished working, bruh"
    }
    
    @IBAction func freezeWithQueue(_ sender: UIButton) {
        myDq = DispatchQueue(label: "testingQueue")
        dwi = DispatchWorkItem {
            for i in 1...1000000 {
                if (self.dwi?.isCancelled)!{
                    break
                }
                print("\(i): 👷🏻‍👷🏻👷🏽👷🏽️👷🏿👷🏿")
            }
            print("We’ve finished working, bruh")
            DispatchQueue.main.async {
                self.countLabel.text = "We’ve finished working, bruh"
            }
        }
        myDq?.async(execute: dwi!)
    }
    
    @IBAction func cancelQueue(_ sender: UIButton) {
        self.dwi?.cancel()
    }
    
    
    @IBAction func isFreezeAction(_ sender: UIButton) {
        workHard {
            if $0 {
                countLabel.text = "We’ve finished working, bruh"
            }
        }
    }
    
    
    func workHard(enterDoStuff: (Bool) -> Void) {
        for _ in 1...1000000 {
            print("👷🏻‍👷🏻👷🏽👷🏽️👷🏿👷🏿")
        }
        enterDoStuff(true)
    }
}

