//
//  GalleryViewController.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 20.10.2021.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var galleryView: UIView!
    
   var mainImageView = UIImageView()
    var secondaryImageView = UIImageView()
    private var isLeftSwipe = false
    private var isRightSwipe = false
    private var chooseFlag = false
     var currentIndex = 0
    
    private var interactiveAnimator: UIViewPropertyAnimator!
    
    let customReuseIdentifier = "customReuseIdentifier"
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: customReuseIdentifier)
        
        setImages(images: photos)

        mainImageView.frame = galleryView.bounds
        mainImageView.contentMode = .scaleAspectFit
        galleryView.addSubview(mainImageView)

        secondaryImageView.frame = galleryView.bounds
        secondaryImageView.contentMode = .scaleAspectFit
        secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        galleryView.addSubview(secondaryImageView)

        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        galleryView.addGestureRecognizer(recognizer)
        
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
       
        if let animator = interactiveAnimator,
           animator.isRunning {return}
        
        
        switch recognizer.state {
        case .began:
            mainImageView.transform = .identity
            mainImageView.image = photos[currentIndex]
                
            secondaryImageView.transform = .identity
                
            mainImageView.bringSubviewToFront(mainImageView)
            
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         curve: .easeInOut,
                                                         animations: { [weak self] in
                                                            self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                                                         })
            interactiveAnimator.pauseAnimation()
            isLeftSwipe = false
            isRightSwipe = false
            chooseFlag = false
                
        case .changed:
            var translation = recognizer.translation(in: view)
            
            if translation.x < 0 && (!isLeftSwipe) && (!chooseFlag) {
                if self.currentIndex == (photos.count - 1) {
                    interactiveAnimator.stopAnimation(true)
                    return
                }
                chooseFlag = true
                onChange(isLeft: true)
                
                self.interactiveAnimator.stopAnimation(true)
                self.interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    self?.secondaryImageView.transform = .identity
                }
                interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: true)
                })
                
                interactiveAnimator.startAnimation()
                interactiveAnimator.pauseAnimation()
                isLeftSwipe = true
            }
            
            if translation.x > 0 && (!isRightSwipe) && (!chooseFlag) {
                if self.currentIndex == 0 {
                    interactiveAnimator.stopAnimation(true)
                    return
                }
                chooseFlag = true
                onChange(isLeft: false)
                interactiveAnimator.stopAnimation(true)
                interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    self?.secondaryImageView.transform = .identity
                }
                interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.onChangeCompletion(isLeft: false)
                })
                interactiveAnimator.startAnimation()
                interactiveAnimator.pauseAnimation()
                isRightSwipe = true
            }
            
            if isRightSwipe && (translation.x < 0) {return}
            if isLeftSwipe && (translation.x > 0) {return}
            
            if translation.x < 0 {
                translation.x = -translation.x
            }
            interactiveAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
            
        case .ended:
            if let animator = interactiveAnimator,
               animator.isRunning {
                return
            }
            var translation = recognizer.translation(in: self.view)
            
            if translation.x < 0 {translation.x = -translation.x}
            
            if (translation.x / (UIScreen.main.bounds.width)) > 0.5  {
                interactiveAnimator.startAnimation()
            }
            else {
                interactiveAnimator.stopAnimation(true)
                interactiveAnimator.finishAnimation(at: .start)
                interactiveAnimator.addAnimations { [weak self] in
                    self?.mainImageView.transform = .identity
                    guard let weakSelf = self else {return}
                    if weakSelf.isLeftSwipe {
                        self?.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
                    }
                    if weakSelf.isRightSwipe {
                        self?.secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
                    }
                }
                
                interactiveAnimator.addCompletion({ [weak self] _ in
                    self?.mainImageView.transform = .identity
                    self?.secondaryImageView.transform = .identity
                    self?.secondaryImageView.image = nil //
                })
                
                interactiveAnimator.startAnimation()
            }
        default:
            return
        }
    }
        
    private func onChange(isLeft: Bool) {
        self.mainImageView.transform = .identity
        self.secondaryImageView.transform = .identity
        self.mainImageView.image = photos[currentIndex]
        
        if isLeft {
            self.secondaryImageView.image = photos[self.currentIndex + 1]
            self.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
        }
        else {
            secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            secondaryImageView.image = photos[currentIndex - 1]
        }
    }
    
    private func onChangeCompletion(isLeft: Bool) {
        mainImageView.transform = .identity
        secondaryImageView.transform = .identity
        if isLeft {
            currentIndex += 1
        }
        else {
            currentIndex -= 1
        }
        mainImageView.image = photos[currentIndex]
        galleryView.bringSubviewToFront(mainImageView)
    }
        
    func setImages(images: [UIImage]) {
        self.photos = images
        if self.photos.count > 0 {
            self.mainImageView.image = images.first
        }
    }
}




