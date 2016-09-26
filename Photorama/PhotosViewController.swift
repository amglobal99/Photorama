//
//  PhotosViewController.swift


import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    
   // @IBOutlet var imageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    
    
    override func viewDidLoad()  {
    
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self

    
        print("PhotosViewController.swift : Calling fetchRecentPhotos method (PhotoStore.swift)")
        print("***** NOTE: This request is working on  abackground thread ******")
        
        
        store.fetchRecentPhotos()    { //begin closure
            
            
                    (photosResult)-> Void in
                
                
                        /*
                
                            switch photosResult {
                            case let .Success(photos):
                                print("      fetchRecentPhotos Handler: Successfully found \(photos.count) recent photos")
                                if let firstPhoto = photos.first {
                                    print("      fetchRecentPhotos Handler: calling fetchImageForPhoto method" )
                                    self.store.fetchImageForPhoto(firstPhoto)
                                        {  // starting handler
                                                (imageResult) -> Void in
                                            
                                                switch imageResult {
                                                        case let .Success(image):
                                                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                                                
                                                                self.imageView.image = image
                                            }
                                            
                                                        case let .Failure(error) :
                                                            print("               fetchImageForPhoto Handler: Error downloading image \(error)" )
                                                }  //end switch
                                    }  ///end handler
                                    
                                }  //end if
                            
                            case let .Failure(error) :
                                print("      fetchRecentPhotos Handler: Error fetching recent photos \(error)"  )
                        } //end switch PhotosResul
                    
        
                        */
                
                
                        // ****** IMPORTTANT *************
                        //  See how Opeartion is used
            
                    print("PhotosViewController.swift : Background operation completed. Now add results to store on Main thread" )
            
            
            
                        OperationQueue.main.addOperation() {
                            
                            switch photosResult {
                            case let .success(photos):
                                print("    PhotosViewController.swift : Successfully found \(photos.count) recent photos" )
                                self.photoDataSource.photos = photos
                            case let .failure(error ) :
                                self.photoDataSource.photos.removeAll()
                                print("    PhotosViewController.swift : Error fetching recent photos \(error)")
                            }
                            
                            self.collectionView.reloadSections(IndexSet(integer: 0) )
                        
                        } //end operation block handler
                        
                            
            
            } // end closure for fetchRecentPhotos
    
    
    
    }  //end method
    
    
    func collectionView (_ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath )  {
            
                let photo = photoDataSource.photos[(indexPath as NSIndexPath).row]
                store.fetchImageForPhoto(photo) {  //begin closure
                        (result) -> Void in
                        
                        OperationQueue.main.addOperation() {
                            let photoIndex = self.photoDataSource.photos.index(of: photo)!
                            let photoIndexPath = IndexPath(row: photoIndex, section: 0)
                            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                                cell.updateWithImage(photo.image)
                            }  // end if
                        } //end operation
            } // end closure
            
    } //end method
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhoto" {
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[(selectedIndexPath as NSIndexPath).row]
                let destinationVC = segue.destination as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            } //end if
        } //end if
    } //end method
    
    
    
}  // end class
