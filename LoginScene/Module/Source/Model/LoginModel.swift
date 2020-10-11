//
//  LoginModel.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/09.
//

import Foundation

enum LoginModel {
    
    struct Request {
        
        let username: String
        let password: String
        let isRemember: Bool
    }
    
    enum Response {
        
        struct Entity {
            
            let success: Bool
            let sid: String
            let username: String
            
            init(success: Bool = false, sid: String = "", username: String = "") {
                self.success = success
                self.sid = sid
                self.username = username
            }
        }
        
        enum Error: Swift.Error {
            
            case invalidUsernameOrPassword
            case failedServer
            case unknown
            
            var message: String {
                switch self {
                case .invalidUsernameOrPassword:
                    return "invalid username or password"
                case .failedServer:
                    return "failedServer"
                case .unknown:
                    return "unknown"
                }
            }
        }
    }
    
    enum ViewModel {
        
        struct AlbumToken {
            
            let username: String
        }
        
        struct Error {
            
            let message: String
        }
    }
}
