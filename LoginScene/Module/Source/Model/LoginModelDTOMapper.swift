//
//  LoginModelDTOMapper.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/09.
//

import Foundation
import APIService

struct LoginModelDTOMapper {
    
    static func map(dto: AuthLoginModel.Response.DTO) -> LoginModel.Response.Entity {
        return LoginModel.Response.Entity(success: dto.success,
                                          sid: dto.data.sid,
                                          username: dto.data.username)
    }
}
