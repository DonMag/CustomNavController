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

class NavVCC: UIViewController, dismissAndPopToRootProtocol {
	
	@IBAction func popBackOneTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
	@IBAction func popToRootTapped(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}
	
	@IBAction func presentTapped(_ sender: Any) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "presentMeVC") as? PresentMeViewController {
			vc.dapDelegate = self
			present(vc, animated: true, completion: nil)
		}
	}
	
	func dismissAndPopToRoot(_ animated: Bool) -> Void {

		// this will dismiss the presented VC and then pop to root on the NavVC stack
		dismiss(animated: animated, completion: {
			self.navigationController?.popToRootViewController(animated: animated)
		})

	}
	
}

// protocol for the presented VC to "call back" to the presenting VC
protocol dismissAndPopToRootProtocol {
	func dismissAndPopToRoot(_ animated: Bool)
}

class PresentMeViewController: UIViewController {
	
	var dapDelegate: dismissAndPopToRootProtocol?
	
	@IBAction func dismissTapped(_ sender: Any) {
		dapDelegate?.dismissAndPopToRoot(false)
	}
	
	@IBAction func dismissAnimTapped(_ sender: Any) {
		dapDelegate?.dismissAndPopToRoot(true)
	}
	
}

