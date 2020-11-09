//  result.swift
//  SaveJSONDataUsingCodableAndImplementTableViewWithSectionProgramatically
//  Created by Ranjeet Raushan on 09/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation
import Foundation
import UIKit

struct Result: Codable{
    let data : [ResultItem]?
}
struct ResultItem: Codable{
    let title : String?
    let items: [String]?
}
