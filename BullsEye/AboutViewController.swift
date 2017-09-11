//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Joe Crescenzi on 9/10/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

	@IBOutlet weak var webView: UIWebView!
	

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

		if let MyURL = Bundle.main.url(forResource: "BullsEye", withExtension: "html")
		{
			if let htmlData = try? Data(contentsOf: MyURL)
			{
				let BaseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
				webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: BaseURL)
			}
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func close()
	{
		dismiss(animated: true, completion: nil)
	}
	
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
