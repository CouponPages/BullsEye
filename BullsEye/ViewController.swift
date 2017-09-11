//
//  ViewController.swift
//  BullsEye
//
//  Created by Joe Crescenzi on 9/10/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var CurrentValue: Int = 50
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@IBAction func showAlert()
	{
		let message = "The slider is \(CurrentValue)"
		let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}
	
	
	@IBAction func sliderMoved(_ slider: UISlider)
	{
			CurrentValue = lroundf(slider.value)
		
	}
	
	
	
	
	
	
}

