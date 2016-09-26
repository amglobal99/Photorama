//
//  PhotoDataSource.swift


import UIKit


class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "UICollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell
        let photo  = photos[(indexPath as NSIndexPath).row]
        cell.updateWithImage(photo.image)
        
        return cell
        
    } //end method
    
    
} //end class
