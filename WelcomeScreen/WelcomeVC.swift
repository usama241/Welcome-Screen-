//
//  WelcomeVC.swift
//  WelcomeScreen
//
//  Created by MacBook on 04/05/2022.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var holderVIew: UIView!
    let ScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    configure()
    }
    private func configure(){
        ScrollView.frame = holderVIew.bounds
        holderVIew.addSubview(ScrollView)
        let titles = ["Welcome","List","All Set"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderVIew.frame.size.width, y: 0, width: holderVIew.frame.size.width, height: holderVIew.frame.size.height))
            ScrollView.addSubview(pageView)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            imageView.contentMode = .center
            imageView.image = UIImage(named: "welcome\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
            
        }
        ScrollView.contentSize = CGSize(width: holderVIew.frame.size.width, height: holderVIew.frame.size.height)
        ScrollView.isPagingEnabled = true
    }
    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 3 else {
            //dismiss
            Core.shared.setIsNotUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll
        ScrollView.setContentOffset(CGPoint(x: holderVIew.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }

  

}
