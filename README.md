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

## How to Use

#### Initializing UIAlertActions

UIAlertAction with handler
``` swift
let action0 = UIAlertAction(title: "First Action", style: .Default, handler: nil)
```
UIAlertAction without handler
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

UIAlertController without Handler
``` swift
self.controller = UIAlertController(title: "hey", message: "ho", preferredStyle: .Alert, actions: [action0,action1])
```

##### Show UIAlertController
``` swift
self.controller.show()
```

