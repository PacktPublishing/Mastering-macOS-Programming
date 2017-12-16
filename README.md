# Mastering macOS Programming

This is the code repository for [Mastering macOS Programming](https://www.packtpub.com/application-development/mastering-macos-programming?utm_source=github&utm_medium=repository&utm_campaign=9781786461698), published by [Packt](https://www.packtpub.com/?utm_source=github). 
It contains all the supporting project files necessary to work through the book from start to finish.

## About the Book
macOS continues to lead the way in desktop operating systems, with its tight integration across the Apple ecosystem of platforms and devices. With this book, you will get an in-depth knowledge of working on macOS, enabling you to unleash the full potential of the latest version using Swift 3 to build applications.

This book will help you broaden your horizons by taking your programming skills to next level. The initial chapters will show you all about the environment that surrounds a developer at the start of a project. It introduces you to the new features that Swift 3 and Xcode 8 offers and also covers the common design patterns that you need to know for planning anything more than trivial projects. You will then learn the advanced Swift programming concepts, including memory management, generics, protocol orientated and functional programming and with this knowledge you will be able to tackle the next several chapters that deal with Apple's own Cocoa frameworks. It also covers AppKit, Foundation, and Core Data in detail which is a part of the Cocoa umbrella framework. The rest of the book will cover the challenges posed by asynchronous programming, error handling, debugging, and many other areas that are an indispensable part of producing software in a professional environment.

By the end of this book, you will be well acquainted with Swift, Cocoa, and AppKit, as well as a plethora of other essential tools, and you will be ready to tackle much more complex and advanced software projects.

## Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter11.


The code will look like the following:
```
func buildShapeLayer() 
  { 
    // CAShapeLayer properties 
    shapeLayer.fillColor = .transparentGold 
    shapeLayer.strokeColor = .niceRed 

    let path = CGPath(ellipseIn: shapeLayer.bounds, 
                      transform: nil) 
    shapeLayer.path = path 

    customView.layer?.addSublayer(shapeLayer) 
 } 
```



## Related Products
* [Swift: Developing iOS Applications](https://www.packtpub.com/virtualization-and-cloud/swift-developing-ios-applications?utm_source=github&utm_medium=repository&utm_campaign=9781787120242)

* [Building iOS 10 Applications with Swift [Video]](https://www.packtpub.com/application-development/building-ios-10-applications-swift-video?utm_source=github&utm_medium=repository&utm_campaign=9781785880988)

* [Mastering Swift 3 - Linux](https://www.packtpub.com/application-development/mastering-swift-3-linux?utm_source=github&utm_medium=repository&utm_campaign=9781786461414)
