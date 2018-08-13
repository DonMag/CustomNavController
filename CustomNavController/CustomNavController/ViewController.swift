//
//  ViewController.swift
//  CustomNavController
//
//  Created by Don Mag on 8/13/18.
//  Copyright © 2018 DonMag. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController, UINavigationControllerDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
	}
	
	func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
		print("Will show in Custom nav", viewController)
	}
	
}

class NavVCRoot: UIViewController {
	
}

class NavVCA: UIViewController {
	
	@IBAction func popBackOneTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func popToRootTapped(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}

class NavVCB: UIViewController {
	
	@IBAction func popBackOneTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func popToRootTapped(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}

class NavVCC: UIViewController {
	
	@IBAction func popBackOneTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func popToRootTapped(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
}
