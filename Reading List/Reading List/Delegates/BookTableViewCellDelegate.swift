//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Jeff Kang on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
    
}
