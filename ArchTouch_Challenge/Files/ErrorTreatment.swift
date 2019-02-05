//
//  ErrorTreatment.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit

class ErrorTreatment: NSObject {

    static func jsonErrorTreatment(error:Int) -> String {
        var message = String()
        switch error {
        case 401:
            message = "Invalid API key: You must be granted a valid key."
        case 404:
            message = "The resource you requested could not be found."
        default:
            message = "Something went wrong, please try again later."
        }
        return message
    }
}
