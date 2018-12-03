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

#if canImport(UIKit)
import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif

#if canImport(CoreGraphics)
import CoreGraphics
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
    
    #if canImport(Foundation)
    /// String encoded in base64 (if applicable).
    ///
    ///        "Hello World!".base64Encoded -> Optional("SGVsbG8gV29ybGQh")
    ///
    public var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    #endif
    
    /// Check if string contains one or more emojis.
    ///
    ///        "Hello 😀".containEmoji -> true
    ///
    public var containEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    #if canImport(Foundation)
    /// Check if string is a valid URL.
    ///
    ///        "https://google.com".isValidUrl -> true
    ///
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string is a valid schemed URL.
    ///
    ///        "https://google.com".isValidSchemedUrl -> true
    ///        "google.com".isValidSchemedUrl -> false
    ///
    public var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string is a valid https URL.
    ///
    ///        "https://google.com".isValidHttpsUrl -> true
    ///
    public var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string is a valid http URL.
    ///
    ///        "http://google.com".isValidHttpUrl -> true
    ///
    public var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string is a valid file URL.
    ///
    ///        "file://Documents/file.txt".isValidFileUrl -> true
    ///
    public var isValidFileUrl: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string only contains digits.
    ///
    ///     "123".isDigits -> true
    ///     "1.3".isDigits -> false
    ///     "abc".isDigits -> false
    ///
    public var isDigits: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    #endif
    
    #if canImport(Foundation)
    /// Bool value from string (if applicable).
    ///
    ///        "1".bool -> true
    ///        "False".bool -> false
    ///        "Hello".bool = nil
    ///
    public var bool: Bool? {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch selfLowercased {
        case "true", "1":
            return true
        case "false", "0":
            return false
        default:
            return nil
        }
    }
    #endif
    
    /// Integer value from string (if applicable).
    ///
    ///        "101".int -> 101
    ///
    public var int: Int? {
        return Int(self)
    }
    
    #if canImport(Foundation)
    /// URL from string (if applicable).
    ///
    ///        "https://google.com".url -> URL(string: "https://google.com")
    ///        "not url".url -> nil
    ///
    public var url: URL? {
        return URL(string: self)
    }
    #endif
    
    #if canImport(Foundation)
    /// Readable string from a URL string.
    ///
    ///        "it's%20easy%20to%20decode%20strings".urlDecoded -> "it's easy to decode strings"
    ///
    public var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    #endif
    
    #if canImport(Foundation)
    /// URL escaped string.
    ///
    ///        "it's easy to encode strings".urlEncoded -> "it's%20easy%20to%20encode%20strings"
    ///
    public var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if the given string contains only white spaces
    public var isWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    #endif
}

// MARK: - Methods
public extension String {
    
    #if canImport(Foundation)
    /// Float value from string (if applicable).
    ///
    /// - Parameter locale: Locale (default is Locale.current)
    /// - Returns: Optional Float value from given string.
    public func float(locale: Locale = .current) -> Float? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.floatValue
    }
    #endif
    
    #if canImport(Foundation)
    /// Double value from string (if applicable).
    ///
    /// - Parameter locale: Locale (default is Locale.current)
    /// - Returns: Optional Double value from given string.
    public func double(locale: Locale = .current) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.doubleValue
    }
    #endif
    
    #if canImport(CoreGraphics) && canImport(Foundation)
    /// CGFloat value from string (if applicable).
    ///
    /// - Parameter locale: Locale (default is Locale.current)
    /// - Returns: Optional CGFloat value from given string.
    public func cgFloat(locale: Locale = .current) -> CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
    #endif
    
    #if canImport(Foundation)
    /// Array of strings separated by new lines.
    ///
    ///        "Hello\ntest".lines() -> ["Hello", "test"]
    ///
    /// - Returns: Strings separated by new lines.
    public func lines() -> [String] {
        var result = [String]()
        enumerateLines { line, _ in
            result.append(line)
        }
        return result
    }
    #endif
    
    #if canImport(Foundation)
    /// SwifterSwift: Returns a localized string, with an optional comment for translators.
    ///
    ///        "Hello world".localized -> Hallo Welt
    ///
    public func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    #endif
    
    /// Safely subscript string with index.
    ///
    ///        "Hello World!"[safe: 3] -> "l"
    ///        "Hello World!"[safe: 20] -> nil
    ///
    /// - Parameter i: index.
    public subscript(safe i: Int) -> Character? {
        guard i >= 0 && i < count else { return nil }
        return self[index(startIndex, offsetBy: i)]
    }
    
    /// Safely subscript string within a half-open range.
    ///
    ///        "Hello World!"[safe: 6..<11] -> "World"
    ///        "Hello World!"[safe: 21..<110] -> nil
    ///
    /// - Parameter range: Half-open range.
    public subscript(safe range: CountableRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    /// Safely subscript string within a closed range.
    ///
    ///        "Hello World!"[safe: 6...11] -> "World!"
    ///        "Hello World!"[safe: 21...110] -> nil
    ///
    /// - Parameter range: Closed range.
    public subscript(safe range: ClosedRange<Int>) -> String? {
        guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
        guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
        return String(self[lowerIndex..<upperIndex])
    }
    
    #if os(iOS) || os(macOS)
    /// Copy string to global pasteboard.
    ///
    ///        "SomeText".copyToPasteboard() // copies "SomeText" to pasteboard
    ///
    public func copyToPasteboard() {
        #if os(iOS)
        UIPasteboard.general.string = self
        #elseif os(macOS)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(self, forType: .string)
        #endif
    }
    #endif
    
    #if canImport(Foundation)
    /// Check if string contains one or more instance of substring.
    ///
    ///        "Hello World!".contain("O") -> false
    ///        "Hello World!".contain("o", caseSensitive: false) -> true
    ///
    /// - Parameters:
    ///   - string: substring to search for.
    ///   - caseSensitive: set true for case sensitive search (default is true).
    /// - Returns: true if string contains one or more instance of substring.
    public func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return range(of: string, options: .caseInsensitive) != nil
        }
        return range(of: string) != nil
    }
    #endif
    
    #if canImport(Foundation)
    /// Count of substring in string.
    ///
    ///        "Hello World!".count(of: "o") -> 2
    ///        "Hello World!".count(of: "L", caseSensitive: false) -> 3
    ///
    /// - Parameters:
    ///   - string: substring to search for.
    ///   - caseSensitive: set true for case sensitive search (default is true).
    /// - Returns: count of appearance of substring in string.
    public func count(of string: String, caseSensitive: Bool = true) -> Int {
        if !caseSensitive {
            return lowercased().components(separatedBy: string.lowercased()).count - 1
        }
        return components(separatedBy: string).count - 1
    }
    #endif
    
    /// Random string of given length.
    ///
    ///        String.random(ofLength: 18) -> "u7MMZYvGo9obcOcPj8"
    ///
    /// - Parameter length: number of characters in string.
    /// - Returns: random string of given length.
    public static func random(ofLength length: Int) -> String {
        guard length > 0 else { return "" }
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        return randomString
    }
    
    /// SwifterSwift: Reverse string.
    public mutating func reverse() {
        let chars: [Character] = reversed()
        self = String(chars)
    }
    
    /// Sliced string from a start index with length.
    ///
    ///        "Hello World".slicing(from: 6, length: 5) -> "World"
    ///
    /// - Parameters:
    ///   - i: string index the slicing should start from.
    ///   - length: amount of characters to be sliced after given index.
    /// - Returns: sliced substring of length number of characters (if applicable) (example: "Hello World".slicing(from: 6, length: 5) -> "World")
    public func slicing(from i: Int, length: Int) -> String? {
        guard length >= 0, i >= 0, i < count  else { return nil }
        guard i.advanced(by: length) <= count else {
            return self[safe: i..<count]
        }
        guard length > 0 else { return "" }
        return self[safe: i..<i.advanced(by: length)]
    }
    
    /// Slice given string from a start index with length (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, length: 5)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - i: string index the slicing should start from.
    ///   - length: amount of characters to be sliced after given index.
    public mutating func slice(from i: Int, length: Int) {
        if let str = slicing(from: i, length: length) {
            self = String(str)
        }
    }
    
    /// Slice given string from a start index to an end index (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(from: 6, to: 11)
    ///        print(str) // prints "World"
    ///
    /// - Parameters:
    ///   - start: string index the slicing should start from.
    ///   - end: string index the slicing should end at.
    public mutating func slice(from start: Int, to end: Int) {
        guard end >= start else { return }
        if let str = self[safe: start..<end] {
            self = str
        }
    }
    
    /// Slice given string from a start index (if applicable).
    ///
    ///        var str = "Hello World"
    ///        str.slice(at: 6)
    ///        print(str) // prints "World"
    ///
    /// - Parameter i: string index the slicing should start from.
    public mutating func slice(at i: Int) {
        guard i < count else { return }
        if let str = self[safe: i..<count] {
            self = str
        }
    }
    
    #if canImport(Foundation)
    /// Date object from string of date format.
    ///
    ///        "2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
    ///        "not date string".date(withFormat: "yyyy-MM-dd") -> nil
    ///
    /// - Parameter format: date format.
    /// - Returns: Date object from string (if applicable).
    public func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    #endif
    
    /// Truncate string (cut it to a given number of characters).
    ///
    ///        var str = "This is a very long sentence"
    ///        str.truncate(toLength: 14)
    ///        print(str) // prints "This is a very..."
    ///
    /// - Parameters:
    ///   - toLength: maximum number of characters before cutting.
    ///   - trailing: string to add at the end of truncated string (default is "...").
    public mutating func truncate(toLength length: Int, trailing: String? = "...") {
        guard length > 0 else { return }
        if count > length {
            self = self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
        }
    }
    
    /// Truncated string (limited to a given number of characters).
    ///
    ///        "This is a very long sentence".truncated(toLength: 14) -> "This is a very..."
    ///        "Short sentence".truncated(toLength: 14) -> "Short sentence"
    ///
    /// - Parameters:
    ///   - toLength: maximum number of characters before cutting.
    ///   - trailing: string to add at the end of truncated string.
    /// - Returns: truncated string (this is an extr...).
    public func truncated(toLength length: Int, trailing: String? = "...") -> String {
        guard 1..<count ~= length else { return self }
        return self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
    }
    
    #if canImport(Foundation)
    /// Convert URL string to readable string.
    ///
    ///        var str = "it's%20easy%20to%20decode%20strings"
    ///        str.urlDecode()
    ///        print(str) // prints "it's easy to decode strings"
    ///
    public mutating func urlDecode() {
        if let decoded = removingPercentEncoding {
            self = decoded
        }
    }
    #endif
    
    #if canImport(Foundation)
    /// Escape string.
    ///
    ///        var str = "it's easy to encode strings"
    ///        str.urlEncode()
    ///        print(str) // prints "it's%20easy%20to%20encode%20strings"
    ///
    public mutating func urlEncode() {
        if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self = encoded
        }
    }
    #endif
    
    /// Pad string to fit the length parameter size with another string in the start.
    ///
    ///   "hue".padStart(10) -> "       hue"
    ///   "hue".padStart(10, with: "br") -> "brbrbrbhue"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    public mutating func padStart(_ length: Int, with string: String = " ") {
        self = paddingStart(length, with: string)
    }
    
    /// Returns a string by padding to fit the length parameter size with another string in the start.
    ///
    ///   "hue".paddingStart(10) -> "       hue"
    ///   "hue".paddingStart(10, with: "br") -> "brbrbrbhue"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    /// - Returns: The string with the padding on the start.
    public func paddingStart(_ length: Int, with string: String = " ") -> String {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count {
            return string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)] + self
        } else {
            var padding = string
            while padding.count < padLength {
                padding.append(string)
            }
            return padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)] + self
        }
    }
    
    /// Pad string to fit the length parameter size with another string in the start.
    ///
    ///   "hue".padEnd(10) -> "hue       "
    ///   "hue".padEnd(10, with: "br") -> "huebrbrbrb"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    public mutating func padEnd(_ length: Int, with string: String = " ") {
        self = paddingEnd(length, with: string)
    }
    
    /// Returns a string by padding to fit the length parameter size with another string in the end.
    ///
    ///   "hue".paddingEnd(10) -> "hue       "
    ///   "hue".paddingEnd(10, with: "br") -> "huebrbrbrb"
    ///
    /// - Parameter length: The target length to pad.
    /// - Parameter string: Pad string. Default is " ".
    /// - Returns: The string with the padding on the end.
    public func paddingEnd(_ length: Int, with string: String = " ") -> String {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count {
            return self + string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)]
        } else {
            var padding = string
            while padding.count < padLength {
                padding.append(string)
            }
            return self + padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)]
        }
    }
}

// MARK: - Initializers
public extension String {
    
    #if canImport(Foundation)
    /// Create a new string from a base64 string (if applicable).
    ///
    ///        String(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
    ///        String(base64: "hello") = nil
    ///
    /// - Parameter base64: base64 string.
    public init?(base64: String) {
        guard let decodedData = Data(base64Encoded: base64) else { return nil }
        guard let str = String(data: decodedData, encoding: .utf8) else { return nil }
        self.init(str)
    }
    #endif
    
    /// Create a new random string of given length.
    ///
    ///        String(randomOfLength: 10) -> "gY8r3MHvlQ"
    ///
    /// - Parameter length: number of characters in string.
    public init(randomOfLength length: Int) {
        guard length > 0 else {
            self.init()
            return
        }
        
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        self = randomString
    }
}

// MARK: - NSAttributedString
public extension String {
    
    #if canImport(UIKit)
    private typealias Font = UIFont
    #endif
    
    #if canImport(Cocoa)
    private typealias Font = NSFont
    #endif
    
    #if os(iOS) || os(macOS)
    /// Bold string.
    public var bold: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: Font.boldSystemFont(ofSize: Font.systemFontSize)])
    }
    #endif
    
    #if canImport(Foundation)
    /// Underlined string
    public var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    #endif
    
    #if canImport(Foundation)
    /// Strikethrough string.
    public var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
    }
    #endif
    
    #if os(iOS)
    /// Italic string.
    public var italic: NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    #endif
    
    #if canImport(UIKit)
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    public func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
    #endif
    
    #if canImport(Cocoa)
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    public func colored(with color: NSColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
    #endif
    
}

#if canImport(Foundation)
// MARK: - NSString extensions
public extension String {
    
    /// SwifterSwift: NSString from a string.
    public var nsString: NSString {
        return NSString(string: self)
    }
    
    /// SwifterSwift: NSString lastPathComponent.
    public var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    
    /// SwifterSwift: NSString pathExtension.
    public var pathExtension: String {
        return (self as NSString).pathExtension
    }
    
    /// SwifterSwift: NSString deletingLastPathComponent.
    public var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    
    /// SwifterSwift: NSString deletingPathExtension.
    public var deletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    
    /// SwifterSwift: NSString pathComponents.
    public var pathComponents: [String] {
        return (self as NSString).pathComponents
    }
    
    /// SwifterSwift: NSString appendingPathComponent(str: String)
    ///
    /// - Parameter str: the path component to append to the receiver.
    /// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
    public func appendingPathComponent(_ str: String) -> String {
        return (self as NSString).appendingPathComponent(str)
    }
    
    /// SwifterSwift: NSString appendingPathExtension(str: String)
    ///
    /// - Parameter str: The extension to append to the receiver.
    /// - Returns: a new string made by appending to the receiver an extension separator followed by ext (if applicable).
    public func appendingPathExtension(_ str: String) -> String? {
        return (self as NSString).appendingPathExtension(str)
    }
    
}
#endif
