//
//  UIEdgeInsets+Ex.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
}
