//
//  ViewController.swift
//  LFSliderExample
//
//  Created by Lucas Farah on 3/13/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let mySlider = LFSlider(frame: CGRect(x: 100, y: 100, width: 350, height: 50))
    view.addSubview(mySlider)
    mySlider.color = UIColor.redColor()
    mySlider.setValue(100, duration: 2)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

