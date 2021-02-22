//
//  ViewController.swift
//  SSN
//
//  Created by Gabriela on 06/10/20.
//  Copyright © 2020 Gabriela Olson. All rights reserved.
//
import GoogleMobileAds
import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "";
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
     override func viewDidLoad() {
        super.viewDidLoad()

        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = nil
        banner.rootViewController = self
        view.addSubview(banner)
        
        genaratorSSN()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        banner.frame = CGRect(x: 0, y: view.frame.size.height-50, width: view.frame.size.width, height: 50).integral
    }
        
    @IBOutlet weak var copyMessage: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var changeButtom: UIButton!
    @IBAction func generateSSN(_ sender: UIButton) {

        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
          // Bring's sender's opacity back up to fully opaque
            sender.alpha = 1.0
        }
        genaratorSSN()
    }
    
    
    
    func genaratorSSN(){
        let ssnValidator = SSNValidator()
        changeButtom.layer.cornerRadius = 8
        var resultRandom = ""
        while(resultRandom == "") {
            let ssn = ssnValidator.randomSSN(length:9)
            if ssnValidator.isValidSSN(ssn){
                resultRandom = ssn
                
            }
        }
        print(resultRandom)
        self.myLabel.text = resultRandom
            
            // write to clipboard
        UIPasteboard.general.string = resultRandom
           // read from clipboard
        _ = UIPasteboard.general.string
            
        self.copyMessage.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              // Bring's sender's opacity back up to fully opaque
        self.copyMessage.alpha = 0
            
        }
    }
    
    
}


