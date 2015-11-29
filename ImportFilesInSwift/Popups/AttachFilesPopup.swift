//
//  AttachFilesPopup.swift
//  ImportFilesInSwift
//
//  Created by Sandeep Gandra on 29/11/15.
//  Copyright © 2015 SampleApps. All rights reserved.
//

import UIKit

public enum AttachmentType : Int {
    
    case kAttachmentType_ImageGallery = 0
    case kAttachmentType_Camera
    case kAttachmentType_Video
    case kAttachmentType_Audio
    case kAttachmentType_Location
    case kAttachmentType_Contact
    case kAttachmentType_count
    
    
}
public protocol AttachmentsPopUpDelegate: NSObjectProtocol
{
    func selectedAttachmentType(type:AttachmentType.RawValue)

}

public class AttachFilesPopup: UIView,ImageButtonDelegate
{
    weak public var delegate:protocol<AttachmentsPopUpDelegate>?
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.grayColor() 
        self.addcontrols()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addcontrols()
    {
        
        var xOff:CGFloat = 10.0,yOff:CGFloat = 10.0
        
        var rect:CGRect = self.frame
        rect = CGRectMake(xOff, yOff, (CGRectGetWidth(rect)-4*xOff)/3,
            (CGRectGetHeight(rect)-3*yOff)/2);
        
        for var k:Int = AttachmentType.kAttachmentType_ImageGallery.rawValue; k < AttachmentType.kAttachmentType_count.rawValue ;k++
        {
            var attachmentTypeBtn:ImageButton = ImageButton(frame: rect)
              attachmentTypeBtn.delegate = self
            attachmentTypeBtn.tag = k
            self.addSubview(attachmentTypeBtn)
            self.setAttachmentTypeBtnData(attachmentTypeBtn);
            rect.origin.x = CGRectGetMaxX(rect)+xOff;
            if (k == AttachmentType.kAttachmentType_Video.rawValue) {
                rect.origin.x = xOff;
                rect.origin.y = CGRectGetMaxY(rect)+yOff;
            }
            
        }
        
    }
    func setAttachmentTypeBtnData(var btn:ImageButton)
    {
        var strImgNormal:String?
        var strImgHighlight:String?
        var strTitle:String?
        
        switch (btn.tag) {
        case AttachmentType.kAttachmentType_ImageGallery.rawValue:
            strImgNormal    = "Gallary.png";
            strTitle = "Gallery";
            strImgHighlight = "";
            break;
        case AttachmentType.kAttachmentType_Camera.rawValue:
            strImgNormal    = "Camera.png";
            strTitle = "Camera";
            strImgHighlight = "";
            break;
        case AttachmentType.kAttachmentType_Video.rawValue:
            strImgNormal    = "Video.png";
            strTitle = "Video";
            strImgHighlight = "";
            break;
        case AttachmentType.kAttachmentType_Audio.rawValue:
            strImgNormal    = "Audio.png";
            strTitle = "Audio";
            strImgHighlight = "";
            break;
        case AttachmentType.kAttachmentType_Location.rawValue:
            strImgNormal    = "Location.png";
            strTitle = "Location";
            strImgHighlight = "";
            break;
        case AttachmentType.kAttachmentType_Contact.rawValue:
            strImgNormal    = "Contact.png";
            strTitle = "Contact";
            strImgHighlight = "";
            break;
        default:
            break;
        }
        
        var imageNormal:UIImage = UIImage(named:strImgNormal!)!
        btn.setBtnImage(imageNormal, title:strTitle!)
    }
    //#pragma mark -ImageButtonDelegate
    public func selectedImageButtonType(type: AttachmentType.RawValue) {
        
        delegate?.selectedAttachmentType(type);
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
}
