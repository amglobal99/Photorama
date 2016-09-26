//
//  PhotoInfoViewController.swift

import UIKit


class PhotoInfoViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    
    // when photo loads show a title
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    
    var store: PhotoStore!
    
    
    
    override func viewDidLoad()  {
        
        super.viewDidLoad()
        
        print("PhotoInfoViewControler.swift: Calling fetchImageForPhoto (PhotoStore.swift) ") 
        
        store.fetchImageForPhoto(photo) {
            (result) -> Void in
            switch result {
            case let .success(image):
                    OperationQueue.main.addOperation() {
                        self.imageView.image = image
                }
            case let .failure(error):
                print("Error fetching image for photo : \(error) " )
            } //end swith
            
        } //end closure
        
        
    }  //end method
    
    
    
}  //end class
