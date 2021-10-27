//
//  LikeCounterView.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 27.10.2021.
//

import UIKit

protocol LikeCounterProtocol: AnyObject {
    func likeCounterIncrement(counter: Int)
    func likeCounterDecrement(counter: Int)
}

@IBDesignable class LikeCounterView: UIView {
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeCounterLabel: UILabel!
    
    weak var delegate: LikeCounterProtocol?
    
    var isHeartOn = false
    var likesCounter: Int = 0
    
    private var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LikeCounterView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    private func setup() {
        view = loadFromNib()
        guard let view = view else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    @IBAction func pressHeartButton(_ sender: UIButton) {
        if isHeartOn {
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likesCounter -= 1
            likeCounterLabel.text = String(likesCounter)
            delegate?.likeCounterDecrement(counter: likesCounter)
        } else {
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likesCounter += 1
            likeCounterLabel.text = String(likesCounter)
            delegate?.likeCounterIncrement(counter: likesCounter)
        }
        isHeartOn.toggle()
    }    
}
