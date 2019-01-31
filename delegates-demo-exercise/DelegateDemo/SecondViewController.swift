//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by Adriana González Martínez on 1/7/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

// Step 1: Adding protocol
//protocol ColorDelegate {
//    func changeColor(colorType: UIColor)
//}

class SecondViewController: UIViewController {

    @IBOutlet weak var firstOption: ColorView!
    @IBOutlet weak var secondOption: ColorView!
    @IBOutlet weak var thirdOption: ColorView!
    
    //Step 2: Creating a delegate property.
//    var delegate: ColorDelegate?
    
    public var changeColor: ((UIColor?) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))
        secondOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))
        thirdOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))

    }
    
    @objc func viewTapped(_ tapGesture: UITapGestureRecognizer) {
        //Step 3: Adding the delegate method call
        self.dismiss(animated: true) {
            let circle = tapGesture.view as? ColorView
//            self.delegate?.changeColor(colorType: (circle?.mainColor)!)
            guard let changeColor = self.changeColor else {return}
            changeColor(circle?.mainColor)
        }
    }
}
