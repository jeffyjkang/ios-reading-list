//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Jeff Kang on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    var delegate: BookTableViewCellDelegate?
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var hasBeenRead: UIButton!
    @IBAction func hasBeenReadAction(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let book = book else { return }
        title.text = book.title
        book.hasBeenRead ? hasBeenRead.setImage(UIImage(named: "checked"), for: .normal) : hasBeenRead.setImage(UIImage(named:"unchecked"), for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
