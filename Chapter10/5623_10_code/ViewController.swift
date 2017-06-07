//
//  ViewController.swift
//  5623_11_code
//
//  Created by Stuart Grimshaw on 20/11/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
  @IBOutlet weak var customView: NSView!
  
  var goButton: NSButton!

  var cosmicDoor:   CALayer!
  var subLayer:     CATextLayer!
  var shapeLayer:   CAShapeLayer!
  var textLayer:    CATextLayer!
  var circleLayers: [CALayer] = []
  var squareLayers: [CALayer] = []
  var cubeLayers:   [CALayer] = []
  var transformLayer: CATransformLayer!
  
  var colors: [CGColor] = [.transparentGold,
                           .silver,
                           .transparentGold,
                           .silver,
                           .transparentGold]
  
  let easeInOut = CAMediaTimingFunction(
    name: kCAMediaTimingFunctionEaseInEaseOut)
  let strings = ["reading","loading","ready..."]
  let lockedString = "Locked"
  let unlockedString = "Unlocked"

  override func viewDidLoad()
  {
    super.viewDidLoad()
    customView.wantsLayer = true
    setUpButton()
  }
  override func viewDidAppear()
  {
    customView.layer?.backgroundColor = .black
    
    buildCosmicDoor()
    buildCircleLayers()
    buildShapeLayer()
    buildTextLayer()
    buildSquareLayers()
    buildTransformLayer()
  }
  
  // goButton
  func setUpButton()
  {
    goButton = NSButton(
      title: "Go",
      target: self,
      action: #selector(ViewController.buttonClicked))
    goButton.wantsLayer = true
    goButton.frame = NSRect(x: 620, y: 10, width: 60, height: 20)
    
    goButton.bezelStyle = NSBezelStyle.recessed
    goButton.layer?.backgroundColor = .gold
    goButton.layer?.cornerRadius = 5.0
    
    customView.addSubview(goButton)
  }
  func buttonClicked()
  {
//    cosmicDoorExplicitAnimation()
//    squareLayersTimingAnimation()
//    keyframeShapeAnimation()
//    textLayerKeyFrameAnimation()
//    groupAnimation()
//    shapeLayerTransaction()
//    moveShapeLayer()
//    affineTransformAnimation()
//    squareLayersCompletionAnimation()
//    circleLayersAnimation()
//    animateTransformLayer()
//    NSViewImplicit()
//    NSViewContextAnimationGroup()
  }

  
  // build layers and sublayers
  func buildCosmicDoor()
  {
    cosmicDoor = CALayer()

    cosmicDoor.bounds = CGRect(x: 0,
                               y: 0,
                               width: 200.0,
                               height: customView.bounds.height * 0.8)
    cosmicDoor.position = CGPoint(x: 120.0,
                                  y: customView.bounds.height * 0.5)
    cosmicDoor.backgroundColor = .black
    cosmicDoor.borderWidth = 1.0
    cosmicDoor.borderColor = .black
    customView.layer?.addSublayer(cosmicDoor)
    
    // shadow
    cosmicDoor.shadowColor = .gold
    cosmicDoor.shadowOffset = CGSize(width: 5.0, height: -5.0)
    cosmicDoor.shadowRadius = 15.0
    cosmicDoor.shadowOpacity = 1.0
  }
  func buildCircleLayers()
  {
    for i in 0..<colors.count
    {
      let  layer = CALayer()
      layer.bounds = CGRect(x: 0.0,
                            y: 0.0,
                            width: 40.0,
                            height: 40.0)
      layer.position =  CGPoint(x: 130,
                                y: 40)
      
      layer.zPosition = CGFloat(-3 * i)
      
      layer.borderColor = colors[i]
//      layer.borderColor = .gold
      layer.borderWidth = 2.0
      layer.cornerRadius = layer.bounds.width * 0.5
      
      circleLayers.append(layer)
      cosmicDoor.addSublayer(layer)
    }
    
    var perspective = CATransform3DIdentity
    perspective.m34 = -0.2
    cosmicDoor.sublayerTransform = perspective
  }

  // CAShapeLayer
  func buildShapeLayer()
  {
    shapeLayer = CAShapeLayer()
    shapeLayer.bounds = CGRect(x: 0.0, y: 0.0,
                               width: 60.0,
                               height: 60.0)
    shapeLayer.position =  CGPoint(x: 334.0,
                                   y: 45)

    shapeLayer.shadowColor = .white
    shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
    shapeLayer.shadowRadius = 15.0
    shapeLayer.shadowOpacity = 1.0
    
    // CAShapeLayer properties
    shapeLayer.fillColor = .transparentGold
    shapeLayer.strokeColor = .niceRed
    
    shapeLayer.lineWidth = 3.0
    shapeLayer.lineDashPattern = [5.0, 3.0]
    shapeLayer.lineDashPhase = 0.0
    shapeLayer.strokeStart = 0.0
    shapeLayer.strokeEnd = 0
    
    let path = CGPath(ellipseIn: shapeLayer.bounds,
                      transform: nil)
    shapeLayer.path = path

    customView.layer?.addSublayer(shapeLayer)
    
    // transform
    var transform = CATransform3DMakeScale(1, 1, 1)
    let rotation = M_PI * 0.55
    transform = CATransform3DRotate(transform,
                                    CGFloat(rotation),
                                    1.0, 1.0, 0.0)
    shapeLayer.transform = transform
  }
  // CATextLayer
  func buildTextLayer()
  {
    textLayer = CATextLayer()
    
    textLayer.bounds = CGRect(x: 0,
                              y: 0,
                              width: 200,
                              height: 34.0)
    textLayer.position = CGPoint(x: 394,
                                 y: 430)
    
    textLayer.backgroundColor = .gold
    textLayer.opacity = 0.3
    
    textLayer.shadowColor = .gold
    textLayer.shadowOffset = CGSize(width: 5.0,
                                    height: -5.0)
    textLayer.shadowRadius = 15.0
    textLayer.shadowOpacity = 1.0
    
    customView.layer?.addSublayer(textLayer)
    
    let fontName = "Luminari" as CFString
    textLayer.font = CTFontCreateWithName(fontName,
                                          0.0,
                                          nil)
    textLayer.fontSize = 24.0
    textLayer.string = lockedString
    textLayer.foregroundColor = .black
    textLayer.isWrapped = true
    textLayer.alignmentMode = kCAAlignmentCenter
    textLayer.contentsScale = (
      NSScreen.main()?.backingScaleFactor)!
  }
  // squareLayers
  func buildSquareLayers()
  {
    for i in 0..<colors.count
    {
      let  layer = CALayer()
      layer.bounds = CGRect(x: 0.0,
                            y: 0.0,
                            width: 30.0,
                            height: 30.0)
      layer.position =  CGPoint(x: 52 + 34  * i,
                                y: 30)
      layer.borderColor = colors[i]
      layer.borderWidth = 2.0
      squareLayers.append(layer)
      customView.layer?.addSublayer(layer)
    }
  }


  //animations
  func moveShapeLayer()
  {
    CATransaction.setAnimationDuration(3.0)
    
    shapeLayer.position = CGPoint(
      x: customView.bounds.width * 0.5,
      y: customView.bounds.height * 0.5)
  }
  
  //CABasicAnimation
  func cosmicDoorExplicitAnimation()
  {
    let animation = CABasicAnimation(
      keyPath: "bounds.size.height")
    animation.duration = 3.0
    animation.fromValue = 0.0
    animation.toValue = view.bounds.height * 0.8
    cosmicDoor.add(animation,
                   forKey: nil)
  }
  // CAMediaTiming
  func squareLayersTimingAnimation()
  {
    for i in 0..<squareLayers.count
    {
      let layer = squareLayers[i]
      
      let newPosition = CGPoint(x: layer.position.x,
                                y: layer.position.y + 50.0)
      
      let animation = CABasicAnimation(keyPath: "position.y")
      animation.toValue = newPosition.y
      animation.duration = 1.0
      animation.beginTime
        = CACurrentMediaTime() + Double(i) * 0.2;
      
      animation.timingFunction = easeInOut
      animation.autoreverses = true
//      animation.repeatCount = 3
      //      animation.repeatDuration = 5.0
      layer.add(animation, forKey: nil)
    }
  }
  // CAKeyframeAnimation
  func keyframeShapeAnimation()
  {
    let kfaY = CAKeyframeAnimation(keyPath: "position.y")
    kfaY.values = [shapeLayer.position.y,
                   80.0, 30.0, 260.0, 30.0, 120.0,
                   shapeLayer.position.y]
    kfaY.duration = 10.0
    kfaY.calculationMode = kCAAnimationCubicPaced
    shapeLayer.add(kfaY, forKey: nil)
    
    let kfaX = CAKeyframeAnimation(keyPath: "position.x")
    kfaX.values = [shapeLayer.position.x,
                   shapeLayer.position.x - 10.0,
                   shapeLayer.position.x + 20.0,
                   shapeLayer.position.x - 10.0,
                   shapeLayer.position.x]
    kfaX.duration = 10.0
    kfaX.calculationMode = kCAAnimationCubic //Linear, Discrete
    shapeLayer.add(kfaX, forKey: nil)
  }
  func textLayerKeyFrameAnimation()
  {
    let kfa = CAKeyframeAnimation(keyPath: "string")
    kfa.values = strings
    kfa.duration = 5.0
    kfa.calculationMode = kCAAnimationLinear
    textLayer.add(kfa, forKey: nil)
    
    textLayer.string = strings.last

  }
  //CAAnimationGroup
  func groupAnimation()
  {
    let groupAnimation = CAAnimationGroup()
    groupAnimation.duration = 5.0
    groupAnimation.timingFunction = easeInOut
    
    let kfa1 = CAKeyframeAnimation(keyPath: "opacity")
    kfa1.values = [1.0,
                   0.2, 1.0, 0.2, 1.0, 0.6,
                   1.0]
    kfa1.duration = 12.0
    kfa1.calculationMode = kCAAnimationLinear
    
    let kfa2 = CAKeyframeAnimation(keyPath: "position.y")
    kfa2.values = [shapeLayer.position.y,
                   100.0, 20.0, 100.0,
                   200.0]
    kfa2.keyTimes = [1.0, 0.5, 0.2, 0.5, 1.0]
    kfa2.calculationMode = kCAAnimationCubicPaced

    groupAnimation.animations = [kfa1, kfa2]
    shapeLayer.add(groupAnimation, forKey: nil)
  }
  // CATransaction
  func shapeLayerTransaction()
  {
    CATransaction.begin()
    CATransaction.setAnimationDuration(5.0)
    
    shapeLayer.shadowOffset.height = 5.0
    shapeLayer.shadowOpacity = 1.0
    
    shapeLayer.lineDashPattern = [10.0, 3.0]
    shapeLayer.lineDashPhase = 90.0
    shapeLayer.strokeEnd = 1.0
    
    CATransaction.commit()
  }
  func affineTransformAnimation()
  {
    CATransaction.begin()
    CATransaction.setAnimationDuration(10.0)
    
    shapeLayer.setAffineTransform(CGAffineTransform(translationX: 0.0, y: 100.0))
    shapeLayer.setAffineTransform(CGAffineTransform(rotationAngle: 20.0))
    shapeLayer.setAffineTransform(CGAffineTransform(scaleX: 0.2, y: 0.2))
    
    CATransaction.commit()
  }
  func squareLayersCompletionAnimation()
  {
    for (i, layer) in squareLayers.enumerated()
    {
      let nextPosition = CGPoint(x: layer.position.x + 20,
                                 y: layer.position.y)
      CATransaction.begin()
      
      CATransaction.setAnimationTimingFunction(easeInOut)
      CATransaction.setAnimationDuration(5.0)
      
      CATransaction.setCompletionBlock({
        print("outer block \(i) done")
        layer.opacity = 0.5
      })
      
      // nested block
      CATransaction.begin()
      CATransaction.setAnimationDuration(8.0)
      CATransaction.setAnimationTimingFunction(easeInOut)
      CATransaction.setCompletionBlock({
        print("inner block \(i) done")
      })
      if i == 2 { layer.position = nextPosition }
      CATransaction.commit()
      
      if i != 2 { layer.position = nextPosition }
//      layer.position = nextPosition
      CATransaction.commit()
    }
  }

  //2.5D
  func circleLayersAnimation()
  {
    let newPosition = CGPoint(
      x: circleLayers[0].position.x - 40.0,
      y: circleLayers[0].position.y + 300.0)
    
    for (i,layer) in circleLayers.enumerated()
    {
      let groupAnimation = CAAnimationGroup()
      groupAnimation.duration = 15.0
      groupAnimation.timingFunction = easeInOut
      
      let animationY = CABasicAnimation(keyPath: "position.y")
      animationY.fromValue = layer.position.y
      animationY.toValue = newPosition.y
      animationY.duration = 2.0
      animationY.repeatCount = 2
      animationY.autoreverses = true
      animationY.timingFunction = easeInOut
      
      let animationX = CAKeyframeAnimation(keyPath: "position.x")
      animationX.values = [layer.position.x,
                           layer.position.x - 80.0,
                           layer.position.x + 40.0,
                           layer.position.x]
      animationX.duration = 4.0
      animationX.autoreverses = true
      animationX.timingFunction = easeInOut
      animationX.beginTime
        = animationY.duration * 2.0 + (Double(i) * 0.2)
      
      groupAnimation.animations = [animationX,
                                   animationY,]
      
      layer.add(groupAnimation, forKey: nil)
    }
  }

  // CATransformLayer
  func buildTransformLayer()
  {
    let sideLength = CGFloat(160.0)
    let rightAngle = CGFloat(M_PI) * 0.5
    transformLayer = CATransformLayer()
    
    func sideLayerWithColor(_ color: CGColor) -> CALayer
    {
      let layer = CALayer()
      layer.frame = CGRect(
        origin: CGPoint(x:0, y:0),
        size: CGSize(width: sideLength,
                     height: sideLength))
      layer.position = CGPoint(x: 500,
                               y: 100)
      layer.borderColor = color
      layer.borderWidth = 6.0
      cubeLayers.append(layer)
      
      return layer
    }
    
    func addLayersToTransformLayer()
    {
      let frontLayer = sideLayerWithColor(.silver)
      transformLayer.addSublayer(frontLayer)
      
      let rightLayer = sideLayerWithColor(.silver)
      var transform = CATransform3DMakeTranslation(
                                        sideLength / 2.0,
                                        0.0,
                                        sideLength / -2.0)
      transform = CATransform3DRotate(transform,
                                      rightAngle,
                                      0.0, 1.0, 0.0)
      rightLayer.transform = transform
      transformLayer.addSublayer(rightLayer)
      
      let backLayer = sideLayerWithColor(.transparentGold)
      backLayer.transform = CATransform3DMakeTranslation(
                                        0.0,
                                        0.0,
                                        -sideLength)
      transformLayer.addSublayer(backLayer)
      
      let leftLayer = sideLayerWithColor(.transparentGold)
      transform = CATransform3DMakeTranslation(
                                        sideLength / -2.0,
                                        0.0,
                                        sideLength / -2.0)
      transform = CATransform3DRotate(transform,
                                      rightAngle,
                                      0.0, 1.0, 0.0)
      leftLayer.transform = transform
      transformLayer.addSublayer(leftLayer)

      let bottomLayer = sideLayerWithColor(.transparentGold)
      bottomLayer.backgroundColor = .transparentGold
      transform = CATransform3DMakeTranslation(
                                        0.0,
                                        sideLength / -2.0,
                                        sideLength / -2.0)
      transform = CATransform3DRotate(transform,
                                      rightAngle,
                                      1.0, 0.0, 0.0)
      bottomLayer.transform = transform
      transformLayer.addSublayer(bottomLayer)
      
      let topLayer = sideLayerWithColor(.silver)
      transform = CATransform3DMakeTranslation(
                                        0.0,
                                        sideLength / 2.0,
                                        sideLength / -2.0)
      transform = CATransform3DRotate(transform,
                                      rightAngle,
                                      1.0, 0.0, 0.0)
      topLayer.transform = transform
      transformLayer.addSublayer(topLayer)
    }
    
    addLayersToTransformLayer()
    
    transformLayer.anchorPointZ = sideLength / -2.0
    applyRotation(xOffset: 6.0,
                  yOffset: 8.0)
    
    customView.layer?.addSublayer(transformLayer)
  }
  func applyRotation(xOffset: Double, yOffset: Double)
  {
    let offset = sqrt(xOffset * xOffset + yOffset * yOffset)
    let rotation = CGFloat(offset *  2 * M_PI / 360.0)
    
    let rotationX = CGFloat(offset) / rotation
    let rotationY = CGFloat(offset) / rotation
    
    let translation = CATransform3DTranslate(
      transformLayer.sublayerTransform, 0.0, 0.0, 0.0)
    
    let completeRotation = CATransform3DRotate(
      transformLayer.sublayerTransform,
      rotation,
      rotationX * translation.m11
        - rotationY * translation.m12,
      rotationX * translation.m22
        - rotationY * translation.m21,
      rotationX * translation.m32
        - rotationY * translation.m31)
    
    transformLayer.sublayerTransform = completeRotation
  }
  func animateTransformLayer()
  {
    CATransaction.begin()
    CATransaction.setAnimationDuration(5.0)
    CATransaction.setCompletionBlock({
      [unowned self] in
      self.textLayer.opacity = 1.0
      self.textLayer.string = self.unlockedString
    })
    applyRotation(xOffset: -290.0, yOffset: -60.0)
    for layer in cubeLayers
    {
      layer.cornerRadius = 80
      layer.backgroundColor = nil
    }
    CATransaction.commit()
  }

  // NSView animations
  func NSViewImplicit()
  {
    NSAnimationContext.current().allowsImplicitAnimation = true
    NSAnimationContext.current().duration = 5.0
    customView.animator().alphaValue = 0.0
  }
  func NSViewBasic()
  {
    let basic = CABasicAnimation()
    basic.beginTime = 0.0
    basic.duration = 3.0
    
    NSAnimationContext.runAnimationGroup({
      context in
      customView.animations = ["alphaValue": basic]
      customView.animator().alphaValue = 0.0},
                                         completionHandler: {
                                          self.customView = nil
    })
  }
  func NSViewContextAnimationGroup()
  {
    NSAnimationContext.runAnimationGroup(
      {
        context in
        
        context.duration = 1.5
        context.timingFunction = CAMediaTimingFunction(
          name: kCAMediaTimingFunctionEaseOut)
        
        customView.animator().alphaValue = 0.0
    })
  }



}

