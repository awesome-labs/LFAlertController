[![Version](https://img.shields.io/cocoapods/v/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![License](https://img.shields.io/cocoapods/l/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![Language](https://img.shields.io/badge/swift-2.1-orange.svg)](http://swift.org)

# LFAlertController
UIAlertController Swift extension with handler inside initialization :large_orange_diamond:

Why? Because _UIAlertController_ has handlers inside each action, forcing the developers to have **duplicated code**. Instead, we can have a _switch_ inside a global handler that is called when any action inside the UIAlertController is called

## How to install

#### Using the Swift file:
Drag the **LFAlertController.swift** from */Sources* to your project

#### Using CocoaPods:
Don't forget to add **use_frameworks!** at the top of your Podfile
``` ruby
pod 'LFAlertController'
```

#### Using SPM
```swift
  .Package(url: "https://github.com/awesome-labs/LFAlertController.git", majorVersion: 0)
```

## How to Use

#### Initializing UIAlertActions

``` swift
let action1 = UIAlertAction(title: "Second Action", style: .Default)
```

#### Initializing UIAlertController
UIAlertController with Handler
``` swift
self.controller = UIAlertController(title: "hey", message: "ho", preferredStyle: .Alert,actions:[action0,action1])
{ (action,index) -> () in

  //Printing index of Action
  print("\(index) - \(action.title!)")
}
```

##### Show UIAlertController
``` swift
self.controller.show()
```

## Other options

UIAlertAction with handler
``` swift
let action0 = UIAlertAction(title: "First Action", style: .Default, handler: nil)
```
UIAlertController without Handler
``` swift
self.controller = UIAlertController(title: "hey", message: "ho", preferredStyle: .Alert, actions: [action0,action1])
```
