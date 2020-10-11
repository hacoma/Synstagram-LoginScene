//
//  LoginModelErrorMapper.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/09.
//

import Foundation
import APIService

struct LoginModelErrorMapper {
    
    static func map(error: AuthLoginModel.Response.Error) -> LoginModel.Response.Error {
        switch error {
        case .parsingFailed:
            return .failedServer
        case .unknown:
            return .unknown
        }
    }
}
