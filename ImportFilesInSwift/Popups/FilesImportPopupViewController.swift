//
//  FilesImportPopupViewController.swift
//  ImportFilesInSwift
//
//  Created by Sandeep Gandra on 29/11/15.
//  Copyright © 2015 SampleApps. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class FilesImportPopupViewController: UIViewController,AttachmentsPopUpDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,MPMediaPickerControllerDelegate {

    var photoLibraryPicker:UIImagePickerController?
    var mediaPicker:MPMediaPickerController?
     var attachfilespopup:AttachFilesPopup?
    override func viewDidLoad() {
        super.viewDidLoad()
       //self.view.backgroundColor = UIColor.redColor()
        var singleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
        self.view.addGestureRecognizer(singleTapGesture);
        
    }
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.addcontrols()
        
    }
    func addcontrols(){
        
        var xOff:CGFloat = (CGRectGetWidth(self.view.frame)-200)/2
        var yOff:CGFloat = CGRectGetMidY(self.view.frame)-75
        var rect:CGRect = CGRect.zero;
        rect.origin = CGPointMake(xOff, yOff);
        rect.size = CGSizeMake(200,150);
        
         attachfilespopup = AttachFilesPopup(frame: rect);
        attachfilespopup?.delegate = self
        self.view.addSubview(attachfilespopup!)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func selectedAttachmentType(type: AttachmentType.RawValue) {
        
        if(type<AttachmentType.kAttachmentType_Audio.rawValue){
            photoLibraryPicker = UIImagePickerController();
            photoLibraryPicker!.delegate = self
            photoLibraryPicker!.allowsEditing = false
        }
        switch(type)
        {
        case AttachmentType.kAttachmentType_ImageGallery.rawValue:
            
                photoLibraryPicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                photoLibraryPicker!.mediaTypes = [kUTTypeImage as String]
                
            
            break;
        case AttachmentType.kAttachmentType_Video.rawValue:
            
                photoLibraryPicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                photoLibraryPicker!.mediaTypes = [kUTTypeMovie as String]
            
            break;
        case AttachmentType.kAttachmentType_Camera.rawValue:
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
                    return;
            }
            
                photoLibraryPicker!.sourceType = UIImagePickerControllerSourceType.Camera;
            
            break;

        case AttachmentType.kAttachmentType_Audio.rawValue:
            
                mediaPicker = MPMediaPickerController(mediaTypes: MPMediaType.AnyAudio)
                //mediaPicker.prompt = @"Select Song";
                mediaPicker!.delegate = self;
                self.presentViewController(mediaPicker!, animated:true, completion:nil)
                return;
            
            break;

        case AttachmentType.kAttachmentType_Location.rawValue:
            break;

        case AttachmentType.kAttachmentType_Contact.rawValue:
            break;
        default:
            break;

            
        }
        if type < AttachmentType.kAttachmentType_Audio.rawValue {
            self.presentViewController(photoLibraryPicker!,animated:true,completion:nil)
            
        }
    }
  
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
    /*
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ( [mediaType isEqualToString:@"public.movie" ])
    {
    
    //NSURL *url =  [info objectForKey:UIImagePickerControllerMediaURL];
    
    }else{
    
    //UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // NSData* imageData = UIImageJPEGRepresentation(image, 1.0);
    
    
    //        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //        NSString* documentsDirectory = [paths objectAtIndex:0];
    //
    //        NSString* fullPathToFile2 = [documentsDirectory stringByAppendingPathComponent:incrementedImgStr];
    //        [imageData writeToFile:fullPathToFile2 atomically:NO];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
    [self dismissViewControllerAnimated:NO  completion:nil];
    }];*/
        self.imagePickerControllerDidCancel(picker)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    
        
        picker.dismissViewControllerAnimated(false,completion:nil)
        self.dismissViewControllerAnimated(false,completion:nil)
    }
   
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
    
//    MPMediaItem *theChosenSong = [[mediaItemCollection items]objectAtIndex:0];
//    NSString *songTitle = [theChosenSong valueForProperty:MPMediaItemPropertyTitle];
//    NSURL *assetURL = [theChosenSong valueForProperty:MPMediaItemPropertyAssetURL];
//    AVURLAsset  *songAsset  = [AVURLAsset URLAssetWithURL:assetURL options:nil];
        self.dismissViewControllerAnimated(false,completion:nil)
        mediaPicker.dismissViewControllerAnimated(false,completion:nil)
        
    }
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
     self.dismissViewControllerAnimated(false,completion:nil)
     mediaPicker.dismissViewControllerAnimated(false,completion:nil)
    
    }
    
    func handleSingleTap(gesture:UITapGestureRecognizer)
    {
        var  pt:CGPoint = gesture.locationInView(gesture.view)
    
        if ( CGRectContainsPoint(self.attachfilespopup!.frame, pt)) {
            return;
    }
    
    self.dismissViewControllerAnimated(false,completion:nil)
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
