//
//  ViewController.swift
//  TestGradientBackground
//
//  Created by Scott Gardner on 12/16/14.
//  Copyright (c) 2014 Scott Gardner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var viewForSpark: UIView!
  @IBOutlet weak var viewForSpark2: UIView!
  @IBOutlet weak var viewForSpark3: UIView!
  var colors = [AnyObject]()
  let gradientLayer = CAGradientLayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gradientLayer.frame = view.bounds
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    setUpColors()
    gradientLayer.colors = colors
    view.layer.insertSublayer(gradientLayer, atIndex: 0)
    viewForSpark.layer.addSublayer(getSparkLayerForView(viewForSpark))
    viewForSpark2.layer.addSublayer(getSparkLayerForView(viewForSpark2))
    viewForSpark3.layer.addSublayer(getSparkLayerForView(viewForSpark3))
  }
  
  override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
    gradientLayer.frame = view.bounds
  }
    
  // MARK: - Helpers
  
  func getSparkLayerForView(view: UIView) -> CALayer {
    let sparkLayer = CALayer()
    sparkLayer.frame = viewForSpark.bounds
    sparkLayer.backgroundColor = UIColor.blueColor().CGColor
    sparkLayer.cornerRadius = 50.0
    sparkLayer.shadowColor = UIColor.whiteColor().CGColor
    sparkLayer.shadowOpacity = 0.6
    sparkLayer.shadowRadius = 70.0
    sparkLayer.shadowOffset = CGSize(width: 700, height: 0)
    return sparkLayer
  }
  
  func setUpColors() {
    colors = [cgColorForRed(51.0, green: 102.0, blue: 103.0),
      cgColorForRed(10.0, green: 22.0, blue: 80.0)]
  }
  
  func cgColorForRed(red: CGFloat, green: CGFloat, blue: CGFloat) -> AnyObject {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).CGColor as AnyObject
  }

}

