//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Arfa Saif on 2020-05-22.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var MessageBubble: UIView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var RightImage: UIImageView!
    @IBOutlet weak var LeftImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        MessageBubble.layer.cornerRadius = MessageBubble.frame.height / 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
