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
            message = NSLocalizedString("error_invalid_api", comment: "")
        case 404:
            message = NSLocalizedString("error_resouce_not_found", comment: "")
        default:
            message = NSLocalizedString("error_SomethingWrong", comment: "")
        }
        return message
    }
}
