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
    
    var completion: ((Friend) -> Void)?
    var friend: Friend?
    
    var completionGroup: ((Group) -> Void)?
    var group: Group?
    
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        titleLabel.text = nil
    }
    
    func configure(friend: Friend, completion: ((Friend) -> Void)?) {
        self.completion = completion
        self.friend = friend
        avatarImageView.image = friend.avatar
        titleLabel.text = friend.name
    }
    
    func configure(group: Group, completion: ((Group) -> Void)?) {
        self.completionGroup = completion
        self.group = group
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
    
    @IBAction func pressAvatarButton(_ sender: UIButton) {
        
        let backViewBounds = backView.bounds
        
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 10,
                       options: .curveEaseIn) {
            self.backView.bounds = CGRect(x: backViewBounds.origin.x,
                                          y: backViewBounds.origin.y,
                                          width: backViewBounds.width + 20,
                                          height: backViewBounds.height)
        } completion: { [weak self] isSuccsess in
            guard let self = self else {return}
            if let friend = self.friend
            {
                self.completion?(friend)
                
            } else if
                let group = self.group
            {
                self.completionGroup?(group)
            }
        }
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
