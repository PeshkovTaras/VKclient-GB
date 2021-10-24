//
//  GalleryCollectionCell.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 20.10.2021.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
    }
    
    func configure(image: UIImage) {
        photoImageView.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
