//
//  ImageButton.swift
//  ImportFilesInSwift
//
//  Created by Sandeep Gandra on 29/11/15.
//  Copyright © 2015 SampleApps. All rights reserved.
//

import UIKit

public protocol ImageButtonDelegate:NSObjectProtocol{
    func selectedImageButtonType(type:AttachmentType.RawValue)
   
}

public class ImageButton: UIView {
    
    weak public var delegate: protocol<ImageButtonDelegate>?
 
    public var buttonObj:UIButton?
    public var labelObj:UILabel?
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        addcontrols()
    }
     func addcontrols(){
        
        
        var rect:CGRect = self.frame
        var BtnHtOff:CGFloat = 15
        
        rect.origin = CGPointZero
        rect.size.height = rect.size.height-BtnHtOff
        
        buttonObj = UIButton(frame:rect)
        buttonObj?.addTarget(self, action: "handleImageBtnTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(buttonObj!)
        
        rect.origin.y = CGRectGetMaxY(rect)
        rect.size.height = BtnHtOff
        labelObj = UILabel(frame: rect)
        self.addSubview(labelObj!)
        labelObj?.adjustsFontSizeToFitWidth = true
        
        
    }
    public func setBtnImage(image:UIImage, title:String)
    {
        
        buttonObj?.setImage(image, forState: UIControlState.Normal)
        labelObj?.text = title
        
    
    }
    func handleImageBtnTouch(sender:UIButton)
    {
        delegate?.selectedImageButtonType(self.tag)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
