//
//  ViewController.swift
//  ImagePointTest
//
//  Created by Lucas Farah on 2/24/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var controller1: UIAlertController!
  var controller2: UIAlertController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Creating Action with handler
    let action0 = UIAlertAction(title: "First Action", style: .Default,handler:nil)
    
    //Creating Action without handler
    let action1 = UIAlertAction(title: "Second Action", style: .Default)
    
    //Creating UIAlertController with handler
    self.controller1 = UIAlertController(title: "Controller1", message: "This is Controller1", preferredStyle: .Alert,actions:[action0,action1]) { (action,index) -> () in
      
      //Printing index of Action
      print("\(index) - \(action.title!)")
    }
    
    //Creating UIAlertController without handler
    self.controller2 = UIAlertController(title: "Controller2", message: "This is Controller2", preferredStyle: .Alert,actions:[action0,action1])
    
    
    //Adding an action outside the initializer
    let action2 = UIAlertAction(title: "Third Action", style: .Default, handler: nil)
    controller1.appendAction(action2)
  }
  
  @IBAction func showController1(sender: AnyObject) {
    controller1.show()
  }
  
  
  @IBAction func showController2(sender: AnyObject) {
    controller2.show()
  }
}


