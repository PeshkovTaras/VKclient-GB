//
//  CustomTableViewCell.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        titleLabel.text = nil
    }
    
    func configure(friend: Friend) {
        avatarImageView.image = friend.avatar
        titleLabel.text = friend.name
    }
    
    func configure(group: Group) {
        avatarImageView.image = group.avatar
        titleLabel.text = group.title
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
