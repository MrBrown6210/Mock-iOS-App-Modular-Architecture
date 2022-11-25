//
//  LMError.swift
//  Core
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

public enum LMError {
    case generic
    case refreshTokenInvalid
    case validateUIFailed(desc: String)
    case apiValidateFailed(code: Int, desc: String)
    case custom(title: String?, desc: String?, code: Int?)
    case apiResponse
    class Enums { }
}

extension LMError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .generic:
            return "Something went wrong"
        case .refreshTokenInvalid:
            return "tokenExpire"
        case .validateUIFailed(let desc):
            return desc
        case .apiValidateFailed(_, let desc):
            return desc
        case .custom(_, let desc, _):
            return desc
        case .apiResponse:
            return "Got error codes, Use \"LMError.customErrorCode\" instead"
        }
    }
    
    public var errorTitle: String? {
        switch self {
        case .generic:
            return "Oops"
        case .refreshTokenInvalid:
            return "tokenExpire"
        case .validateUIFailed(_):
            return ""
        case .apiValidateFailed(_, let desc):
            return desc
        case .custom(let title, _, _):
            return title
        case .apiResponse:
            return "Got error codes, Use \"KMError.customErrorCode\" instead"
        }
    }
    
    public var errorCode: Int? {
        switch self {
        case .generic:
            return 500
        case .custom(_ , _, let code):
            return code
        case .apiValidateFailed(code: let code, desc: _):
            return code
        case .validateUIFailed:
            return nil
        case .apiResponse:
            return nil
        case .refreshTokenInvalid:
            return 401
        }
    }
    
    private func tranform(code: Int, message: String) -> LMError {
        switch code {
        default:
            return LMError.custom(title: nil, desc: message, code: code)
        }
    }
    
}
