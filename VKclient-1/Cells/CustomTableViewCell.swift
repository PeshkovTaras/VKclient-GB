//
//  CustomTableViewCell.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 16.10.2021.
//

import UIKit

protocol CustomTableCellProtocol: AnyObject {
    func customTableCellLikeCounterIncrement(counter: Int)
    func customTableCellLikeCounterDecrement(counter: Int)
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeView: LikeCounterView!
    
    weak var delegate: CustomTableCellProtocol?
    
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
        
        likeView.delegate = self
        
        avatarImageView.layer.cornerRadius = (customTableCellHeight-8)/2
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 1
        
        backView.layer.cornerRadius = (customTableCellHeight-8)/2
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 4, height: 4)
        backView.layer.shadowRadius = 7
        backView.layer.shadowOpacity = 0.5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CustomTableViewCell: LikeCounterProtocol {
    func likeCounterIncrement(counter: Int) {
        delegate?.customTableCellLikeCounterIncrement(counter: counter)
    }
    
    func likeCounterDecrement(counter: Int) {
        delegate?.customTableCellLikeCounterDecrement(counter: counter)
    }
}
