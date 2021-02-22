//
//  SSNValidator.swift
//  SSN
//
//  Created by Gabriela on 21/02/21.
//  Copyright © 2021 Gabriela Olson. All rights reserved.
//

import Foundation

struct SSNValidator {
    func isValidSSN (_ ssn: String) -> Bool{
        
        let regexSSN = "^(?!219099999|078051120)(?!666|000|9\\d{2})\\d{3}(?!00)\\d{2}(?!0{4})\\d{4}$"
        return ssn.range(of: regexSSN, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func randomSSN(length: Int) -> String {

        let characters : NSString = "0123456789"
        let len = UInt32(characters.length)

        var randomSSN = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextCharact = characters.character(at: Int(rand))
            randomSSN += NSString(characters: &nextCharact, length: 1) as String
        }
        return randomSSN
    }
    

}
