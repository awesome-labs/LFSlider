# LFSlider
UISlider extension with a label value and value change animation
![ezgif com-video-to-gif 1](https://cloud.githubusercontent.com/assets/6511079/15384669/2986881c-1d51-11e6-9050-7d1a4c398cac.gif)

## Installation

#### Using the Swift file:
Drag the **LFSlider.swift** to your project

#### Using CocoaPods:
⚠️⚠️ Coming soon! ⚠️⚠️

## Implementation

Creating a **LFSlider**
``` swift 
let mySlider = LFSlider(frame: CGRect(x: 100, y: 100, width: 400, height: 50))
view.addSubview(mySlider)
```

Changing value of a LFSlider with animation
``` swift 
mySlider.setValue(100, duration: 2)
```

Changing color of a LFSlider
``` swift 
mySlider.color = UIColor.redColor()
```
