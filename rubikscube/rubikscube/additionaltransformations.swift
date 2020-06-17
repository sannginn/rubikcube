//
//  additionaltransformations.swift
//  rubikscube
//
//  Created by Ashkan Memarian on 2019-11-07.
//  Copyright © 2019 Ashkan Memarian. All rights reserved.
//

import UIKit

public protocol additionaltransformationsdelegate{
    func T1()
    func T2()
    func T3()
    func T4()
    func T5()
    func T6()
    func T7()
    func T8()
    func T9()
    }


class additionaltransformations: NSObject {
    
    override init(){
    }
    
    open var delegate: additionaltransformationsdelegate?
    //extra transformations:

}
