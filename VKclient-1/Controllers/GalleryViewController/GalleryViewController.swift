//
//  GalleryViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 20.10.2021.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let customReuseIdentifier = "customReuseIdentifier"
    
    var photos = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: customReuseIdentifier)
    }
}




