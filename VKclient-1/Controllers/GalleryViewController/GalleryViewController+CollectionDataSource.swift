//
//  GalleryViewController+CollectionDataSource.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 20.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customReuseIdentifier, for: indexPath) as? GalleryCollectionCell
        else { return UICollectionViewCell() }
        
        cell.configure(image: self.photos[indexPath.item])
        
        return cell
    }    
}
