//
//  ViewController.swift
//  MiracleBeer
//
//  Created by Marko Poikkimäki on 2017-03-16.
//  Copyright © 2017 Marko Poikkimäki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TxtName: UITextField!
    @IBOutlet weak var TxtBeers: UITextField!
    @IBOutlet weak var Lbl_thanks: UILabel!
    @IBOutlet weak var stack1: UIStackView!

    @IBOutlet weak var img_beer_cheers: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stack1.isHidden = false
        
        img_beer_cheers.isHidden = true
        Lbl_thanks.isHidden = true
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        if img_beer_cheers.isHidden == false {
            img_beer_cheers.isHidden = true
            Lbl_thanks.isHidden = true
            
            stack1.isHidden = false 
        }
        
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BtnBeerClick(_ sender: UIButton) {
        
        stack1.isHidden = true
        

        img_beer_cheers.isHidden = false
        
        img_beer_cheers.frame.origin.y = ((self.view.bounds.size.height - img_beer_cheers.frame.size.height) / 2.0)

        img_beer_cheers.frame.origin.x = ((self.view.bounds.size.width - img_beer_cheers.frame.size.width) / 2.0)
        
        
        let name = TxtName.text!
        let beers = TxtBeers.text!
        
        Lbl_thanks.frame.size.width = 300.0
        Lbl_thanks.frame.size.height = 30.0
        Lbl_thanks.text = "Thanks \(name)! You ordered \(beers) beers! Cheers!"
        Lbl_thanks.isHidden = false
        Lbl_thanks.frame.origin.y = img_beer_cheers.frame.origin.y + img_beer_cheers.frame.size.height + 20.0
        Lbl_thanks.frame.origin.x = img_beer_cheers.frame.origin.x
 
        Lbl_thanks.numberOfLines = 0
        Lbl_thanks.lineBreakMode = .byWordWrapping
        Lbl_thanks.sizeToFit()
    }

}

