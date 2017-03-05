//
//  UIAlertControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 23/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//
import UIKit

public extension UIAlertController {
    
    /// EZSE: easy way to present UIAlertController
    public func show(){
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
    
    /// LFAlertController: Simple UIAlertController with actions and handler
    @nonobjc public convenience init(title: String, message: String, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction], handler: @escaping (_ action:UIAlertAction,_ index:Int) -> ())
    {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
        for action in actions
        {
            let act = UIAlertAction(title: action.title!, style: action.style, controller: self)
            self.addAction(act)
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "NotificationIdentifier"), object: nil, queue: nil) { (notification) -> Void in
            
            if let index = notification.object
            {
                handler(self.actions[index as! Int], index as! Int)
            }
        }
    }
    
    /// LFAlertController: Simple UIAlertController with actions
    @nonobjc public convenience init(title: String, message: String, preferredStyle: UIAlertControllerStyle, actions: [UIAlertAction])
    {
        self.init(title: title, message: message, preferredStyle: preferredStyle)
        
        for action in actions
        {
            self.addAction(action)
        }
    }
    
    //EZSE: Returns the index of UIAlertViewController's action from title
    public func indexOfActionForTitle(title:String) -> Int
    {
        for action in self.actions
        {
            if action.title == title
            {
                return self.actions.index(of: action)!
            }
        }
        return 99
    }
    
    //LFAlertController: Appends UIAlertAction with NSNotification
    public func appendAction(action:UIAlertAction)
    {
        let act = UIAlertAction(title: action.title!, style: action.style, controller: self)
        self.addAction(act)
    }
    
}

extension UIAlertAction {
    
    /// LFAlertController: UIAlertAction initialization without handler
    public convenience init(title: String,style: UIAlertActionStyle)
    {
        self.init(title: title, style: style) { (action) -> Void in
        }
    }
    
    /// LFAlertController: private UIAlertAction initialization with controller
    internal convenience init(title: String,style: UIAlertActionStyle,controller:UIAlertController) {
        self.init(title: title, style: style) { (action) -> Void in
            
            
            let notification = Notification(name: Notification.Name(rawValue: "NotificationIdentifier"), object: controller.indexOfActionForTitle(title: title))
            NotificationCenter.default.post(notification)
        }
    }
}
