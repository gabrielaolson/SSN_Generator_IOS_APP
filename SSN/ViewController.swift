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
        banner.adUnitID = "ca-app-pub-9323874687512151/5661133055"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers =
        ["ca-app-pub-9323874687512151~1035492330"]
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
         genaratorSSN()
    }

    
        func genaratorSSN(){
            
            
            changeButtom.layer.cornerRadius = 4
            func isValidSSN (_ ssn: String) -> Bool{
                
                let regex = "^(?!219099999|078051120)(?!666|000|9\\d{2})\\d{3}(?!00)\\d{2}(?!0{4})\\d{4}$"
                
                
                return ssn.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
            }


            func randomString(length: Int) -> String {

                let characters : NSString = "0123456789"
                let len = UInt32(characters.length)

                var randomString = ""

                for _ in 0 ..< length {
                    let rand = arc4random_uniform(len)
                    var nextChar = characters.character(at: Int(rand))
                    randomString += NSString(characters: &nextChar, length: 1) as String
                }

                return randomString
            }
            
            var resultRandom = ""
            while(resultRandom == "") {
                let ssn = randomString(length:9)
                if isValidSSN(ssn){
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
              // Bring's sender's opacity back up to fully opaque
                self.copyMessage.alpha = 0
                
                
            
            }
            }
    }


