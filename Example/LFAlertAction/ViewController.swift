//
//  ViewController.swift
//  ImagePointTest
//
//  Created by Lucas Farah on 2/24/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imgv: UIImageView!
  
  var controller: UIAlertController!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Creating Actions
    let action0 = UIAlertAction(title: "First Action", style: .Default, handler: nil)
    let action1 = UIAlertAction(title: "Second Action", style: .Default, handler: nil)
    
    //Creating UIAlertController with handler
    self.controller = UIAlertController(title: "hey", message: "ho", preferredStyle: .Alert,actions:[action0,action1]) { (action,index) -> () in
      
      //Printing index of Action
      print("\(index) - \(action.title!)")
    }
    
    //Adding an action outside the initializer
    let action2 = UIAlertAction(title: "Third Action", style: .Default, handler: nil)
    controller.appendAction(action2)
  }
  
  @IBAction func showAction(sender: AnyObject) {
    controller.show()
  }
  
}


