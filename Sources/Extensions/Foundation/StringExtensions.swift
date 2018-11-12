//
//  StringExtensions.swift
//  SFExtension
//
//  Created by cy on 2018/11/12.
//  Copyright © 2018 cmapu. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

// MARK: - Properties
extension String {
    #if canImport(Foundation)
    
    /// String decoded from base64 (if applicable).
    ///
    ///     "SGVsbG8gV29ybGQh".base64Decoded = Optional("Hello World!")
    ///
    public var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else {return nil}
        return String(data: decodedData, encoding: String.Encoding.utf8)
    }
    #endif
}
