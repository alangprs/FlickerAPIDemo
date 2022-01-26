//
//  ShowImageViewController.swift
//  FlickerAPIDemo
//
//  Created by will on 2022/1/26.
//

import UIKit

class ShowImageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var showImageData: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension ShowImageViewController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    

    
}
