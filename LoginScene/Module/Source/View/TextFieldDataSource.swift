//
//  TextFieldDataSource.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/11.
//

protocol TextFieldDataSource {
    
    var textDidChange: (() -> Void)? { get set }
    var text: String? { get }
}
