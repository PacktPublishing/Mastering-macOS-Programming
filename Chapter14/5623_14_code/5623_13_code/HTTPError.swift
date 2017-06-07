//
//  HTTPError.swift
//  5623_13_code
//
//  Created by Stuart Grimshaw on 15/09/16.
//  Copyright © 2016 Stuart Grimshaw. All rights reserved.
//

import Foundation

class HTTPError
{
    static func downloadError(source: String, error: Error?)
    {
        if let err = error
        {
            print(source, err)
        }
    }
}
