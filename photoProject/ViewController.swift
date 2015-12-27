//
//  ViewController.swift
//  photoProject
//
//  Created by Carlos Brito on 27/12/15.
//  Copyright © 2015 Carlos Brito. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoView: UIImageView!
    private let picker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) {
            cameraButton.hidden = true
            
        }
        picker.delegate = self
    }

    @IBAction func actionSave() {
    
        UIImageWriteToSavedPhotosAlbum(photoView.image!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Done", message: "Saved in Album", preferredStyle: .Alert)
        let actionOk = UIAlertAction(title: "Ok", style: .Default, handler:
            {accion in
                //..
        })
        
        alert.addAction(actionOk)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func actionCamera(sender: AnyObject) {
        
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func actionAlbum(sender: AnyObject) {
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        photoView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    

}

