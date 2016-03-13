//
//  LFSlider.swift
//  LFSlider
//
//  Created by Lucas Farah on 3/12/16.
//  Copyright © 2016 Lucas Farah. All rights reserved.
//

import UIKit

class LFSlider: UIView {

	var height: CGFloat?
	var width: CGFloat?

	var label: UILabel?
	var slider: UISlider?
	var color: UIColor?
	{
		didSet
		{
      self.label?.textColor = self.color
      self.slider?.thumbTintColor = self.color
		}
	}

  override init(frame:CGRect)
	{
		super.init(frame: CGRect(x: 100, y: 100, width: frame.width, height: frame.height))

		self.height = frame.height
		self.width = frame.width

		self.slider = UISlider(frame: CGRect(x: 0, y: 0, width: self.frame.width * 0.6, height: self.frame.height))
		self.slider!.maximumValue = 100
		self.slider!.value = 50
		self.slider!.addTarget(self, action: Selector("sliderValueChanged:"), forControlEvents: .ValueChanged)
		self.addSubview(self.slider!)

		self.label = UILabel(frame: CGRect(x: self.slider!.frame.width + (self.frame.width * 0.1), y: 0, width: self.frame.width - self.slider!.frame.width - (self.frame.width * 0.1), height: self.frame.height))
		self.label!.text = "\(Int(self.slider!.value))%"
		self.label!.adjustsFontSizeToFitWidth = true

		self.addSubview(self.label!)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func sliderValueChanged(sender: UISlider)
	{
		self.label?.text = "\(Int(sender.value))%"
	}

	func setValue(value: Float, duration: Double = 4) {
		self.slider?.setValue(value, duration: duration)
		self.label?.setValue(Int(value), duration: duration)
	}
}

extension NSTimer
{
	public static func runThisEvery(seconds seconds: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
		let fireDate = CFAbsoluteTimeGetCurrent()
		let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
		CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
		return timer
	}
}

extension UILabel
{
	func setValue(number: Int, duration: Double)
	{
		if var currentNumber = Int(self.text!.substringWithRange(Range<String.Index>(start: self.text!.startIndex, end: self.text!.endIndex.advancedBy(-1))))
		{
			let timerNumber = currentNumber
			NSTimer.runThisEvery(seconds: duration / Double(abs(number - timerNumber))) { (timer) -> Void in

				if currentNumber == number
				{
					timer.invalidate()
				}
				else if currentNumber < number
				{
					currentNumber += 1
					self.text = "\(currentNumber)%"
				}
				else if currentNumber > number
				{
					currentNumber -= 1
					self.text = "\(currentNumber)%"
				}
			}
		}
	}
}
extension UISlider
{
	/// EZSE: Slider moving to value with animation duration
	public func setValue(value: Float, duration: Double) {
		UIView.animateWithDuration(duration, animations: { () -> Void in
			self.setValue(self.value, animated: true)
		}) { (bol) -> Void in
			UIView.animateWithDuration(duration, animations: { () -> Void in
				self.setValue(value, animated: true)
				}, completion: nil)
		}
	}
}