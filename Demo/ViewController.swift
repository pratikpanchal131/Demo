//
//  ViewController.swift
//  Demo
//
//  Created by indianic on 25/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit
import Pratiktest2

class ViewController: UIViewController {

    var obj  = PKDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
//        self.loadNib()                  // Load Xib
        self.loadStoryboard()           // Load Stroyboard
        
    }
    
    // Mark:- Load XIB
    func loadNib() {
    
        let view = MyClass.instanceFromNib()
        self.view.addSubview(view)
    }
    // Mark:- Load Storyboard
    func loadStoryboard()
    {
        
        PratikFramework.performSegueToFrameworkVC(caller: self)
        let podBundle = Bundle(for: PKDatePicker.self)
        let bundleURL = podBundle.url(forResource: "Pratiktest2", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "Date", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()!
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class MyClass: UIView {
    
    class func instanceFromNib() -> UIView {
                let podBundle = Bundle(for: PKDatePicker.self)
                let bundleURL = podBundle.url(forResource: "Pratiktest2", withExtension: "bundle")
                let bundle = Bundle(url: bundleURL!)!
        return UINib(nibName: "pc4", bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
    }
    
    
}

public class PratikFramework {
    
    public static func performSegueToFrameworkVC(caller: UIViewController) {
        
        let podBundle = Bundle(for: PKDatePicker.self)
        let bundleURL = podBundle.url(forResource: "Pratiktest2", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)!
        let storyboard = UIStoryboard(name: "Date", bundle: bundle)
        let vc = storyboard.instantiateInitialViewController()!
        caller.present(vc, animated: true, completion: nil)
        
        
    }
}

