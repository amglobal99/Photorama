//
//  PhotoCollectionViewCell.swift
//  Photorama
//


import UIKit


// This is our custom Cell


class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    

    
    func updateWithImage(_ image: UIImage?) {
        if let imageToDisplay = image {
            spinner .stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner .startAnimating()
            imageView.image = nil
        }
        
    }  //end method
    
    
    
    // called when cell is first created
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateWithImage(nil )
    }
    
    
    // called when cell is being reused
    override func prepareForReuse() {
        super.prepareForReuse()
        updateWithImage(nil )
    }
    
    
    
    
}   // end class
