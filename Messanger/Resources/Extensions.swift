//
//  Extensions.swift
//  Messanger
//
//  Created by Saad Suleman on 09/11/2024.
//

import Foundation
import UIKit

extension UIView {
    public var width : CGFloat{
        return self.frame.size.width
    }
    public var height : CGFloat{
        return self.frame.size.height
    }
    public var top : CGFloat{
        return self.frame.origin.y
    }
    public var bottom : CGFloat{
        return self.frame.size.height + self.frame.origin.y
    }
    public var left : CGFloat{
        return self.frame.origin.x
    }
    public var tight : CGFloat{
        return self.frame.size.width + self.frame.origin.x
    }
}
