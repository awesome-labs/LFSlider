//
//  ViewController.swift
//  LFSlider
//
//  Created by Lucas Farah on 3/12/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let mySlider = LFSlider(width: 100, height: 50)
    view.addSubview(mySlider)
    
    mySlider.setValue(100, duration: 2)
  }

  func sliderValueChanged(sender:UISlider)
  {
    print(sender.value)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

