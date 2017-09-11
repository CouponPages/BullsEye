//
//  ViewController.swift
//  BullsEye
//
//  Created by Joe Crescenzi on 9/10/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var CurrentValue = 0
	var TargetValue = 0
	var Score = 0
	var Round = 0
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var TargetLabel: UILabel!
	@IBOutlet weak var RoundLabel: UILabel!
	@IBOutlet weak var ScoreLabel: UILabel!
	
	//
	//
	override func viewDidLoad()
	{
		super.viewDidLoad()
		StartNewGame()
		UpdateLabels()
	}
	
	//
	//
	@IBAction func StartNewGame()
	{
		Score = 0
		Round = 0
		StartNewRound()
		UpdateLabels()
	}
	
	
	//
	//
	func StartNewRound()
	{
		Round += 1
		TargetValue = 1 + Int(arc4random_uniform(100))
		CurrentValue = 50
		slider.value = Float(CurrentValue)
	}
	
	//
	//
	func UpdateLabels()
	{
		TargetLabel.text = String(TargetValue)
		ScoreLabel.text = String(Score)
		RoundLabel.text = String(Round)
	}
	
	
	//
	//
	@IBAction func showAlert()
	{
		let Difference = abs(TargetValue - CurrentValue)
		var Points = 100 - Difference

		let Title: String
		if Difference == 0
		{
			Title = "Bulls Eye!"
			Points += 100
		}
		else if Difference < 5
		{
			Title = "Missed by \(Difference)\nYou ALMOST Had It!"
			if Difference == 1
			{
				Points += 50
			}
			
		}
		else if Difference < 10
		{
			Title = "Missed by \(Difference)\nNot Bad"
		}
		else
		{
			Title = "Missed by \(Difference)\nNot Even Close..."
		}
		Score += Points
		let message = "You Selected \(CurrentValue)\nYou Scored \(Points) Points."
		let alert = UIAlertController(title: Title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: {
					action in
					self.StartNewRound()
					self.UpdateLabels()
					})
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
		// StartNewRound()
		// UpdateLabels()
	}
	
	//
	//
	@IBAction func sliderMoved(_ slider: UISlider)
	{
			CurrentValue = lroundf(slider.value)
		
	}
	
	
	//
	//
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	
	
}

