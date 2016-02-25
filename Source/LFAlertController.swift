//
//  UIAlertControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 23/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//
import UIKit

extension UIAlertController {
  
  /// EZSE: easy way to present UIAlertController
  func show(){
    UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(self, animated: true, completion: nil)
  }
  
  /// LFAlertController: Simple UIAlertController with actions and handler
  @nonobjc convenience init(title: String, message: String, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], handler: (action:UIAlertAction,index:Int) -> ())
  {
    self.init(title: title, message: message, preferredStyle: preferredStyle)
    
    for action in actions
    {
      let act = UIAlertAction(title: action.title!, style: action.style, controller: self)
      self.addAction(act)
    }
    
    NSNotificationCenter.defaultCenter().addObserverForName("NotificationIdentifier", object: nil, queue: nil) { (notification) -> Void in
      
      if let index = notification.object
      {
        handler(action: self.actions[index as! Int], index: index as! Int)
      }
    }
  }
  
  /// LFAlertController: Simple UIAlertController with actions
  @nonobjc convenience init(title: String, message: String, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction])
  {
    self.init(title: title, message: message, preferredStyle: preferredStyle)
    
    for action in actions
    {
      self.addAction(action)
    }
  }
  
  //EZSE: Returns the index of UIAlertViewController's action from title
  func indexOfActionForTitle(title:String) -> Int
  {
    for action in self.actions
    {
      if action.title == title
      {
        return self.actions.indexOf(action)!
      }
    }
    return 99
  }
  
  //EZSE: Appends UIAlertAction with NSNotification
  func appendAction(action:UIAlertAction)
  {
    let act = UIAlertAction(title: action.title!, style: action.style, controller: self)
    self.addAction(act)
  }
  
}

extension UIAlertAction {
  
  /// LFAlertController: UIAlertAction initialization without handler
  convenience init(title: String,style: UIAlertActionStyle) {
    self.init(title: title, style: .Default) { (action) -> Void in
    }
  }
  
  /// LFAlertController: private UIAlertAction initialization with controller
  private convenience init(title: String,style: UIAlertActionStyle,controller:UIAlertController) {
    self.init(title: title, style: .Default) { (action) -> Void in
      let notification = NSNotification(name: "NotificationIdentifier", object: controller.indexOfActionForTitle(title))
      NSNotificationCenter.defaultCenter().postNotification(notification)
    }
  }
}
