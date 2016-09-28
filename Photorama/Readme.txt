
// ******************************
//  Photorama Application
//
//  Updated : September 26, 2016
//
//
// ********************************


About:

This application pulls recent photos from the Flickr website.
It displays the photos in a grid.
When a thumbnail is tapped, the photo is displayed in a Detail screen.
When the photo gets displayed, its Title is set on the Navigation Bar.



Key Components/ Classes:

	PhotosViewController.swift ( Main CollectionView )
	PhotoInfoViewController.swift  ( displays the Detail screen for Photo)

Supporting Classes:

	FlickrAPI.swift   ( generates the URL with needed parameters)
	PhotoStore.swift  ( this fetches photos from Flickr)
	Photo.swift   	    ( models the Photo object)
	PhotoDataSource.swift   ( provides Cell for CollectionView)
	PhotoCollectionViewCell.swift	( provide spinner, update Image in cell ..)



	// *****************************************************


Workflow:

When loading, AppDelegate initializes and instance of PhotoStore().

Then PhotosViewController loads to show the main screen.
here, in viewDidLoad, we use PhotoStore to call ‘fetchRecentPhotos’


PhotoStore has these methods:
	- fetchRecentPhotos
	- fetchImageForPhoto
	- processRecentPhotoRequests
	- processImageRequest




