//
//  Text segment.swift
//  Journaling
//
//  Created by Daniel Wai on 4/25/23.
//

import SwiftUI


class textobject {
    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat{
        
        var currentheight: CGFloat!
        
        let textview = UITextView(frame: CGRect(x: 0,y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        textview.text = text
        textview.font = font
        textview.sizeToFit()
        
        currentheight = textview.frame.height
        
        return currentheight
    }
    
}


