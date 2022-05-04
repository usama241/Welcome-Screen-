//
//  ViewController.swift
//  WelcomeScreen
//
//  Created by MacBook on 04/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser(){
            let vc = storyboard?.instantiateViewController(identifier: "welcome")
            vc?.modalPresentationStyle = .fullScreen
            present(vc!, animated: true)
        }
    }

}
class Core {
    static let shared = Core()
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    func setIsNotUser() {
        UserDefaults.standard.setValue(true, forKey: "isNewUser")
    }
}
