//
//  StringTests.swift
//  SFExtension
//
//  Created by cy on 2018/11/12.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    var helloWorld = "Hello World!"
    
    override func setUp() {
        super.setUp()
        NSTimeZone.default = NSTimeZone.system
    }
    
    func testBase64Decoded() {
        XCTAssertEqual("SGVsbG8gV29ybGQh".base64Decoded, helloWorld)
        XCTAssertNil(helloWorld.base64Decoded)
    }
    
    func testBase64Encoded() {
        XCTAssertEqual(helloWorld.base64Encoded, "SGVsbG8gV29ybGQh")
    }
    
    func testContainEmoji() {
        XCTAssert("Hello 😂".containEmoji)
        XCTAssertFalse("Hello ;)".containEmoji)
    }
    
    func testIsValidUrl() {
        XCTAssert("https://google.com".isValidUrl)
        XCTAssert("http://google.com".isValidUrl)
        XCTAssert("ftp://google.com".isValidUrl)
    }
    
    func testIsValidSchemedUrl() {
        XCTAssertFalse("Hello world!".isValidSchemedUrl)
        XCTAssert("https://google.com".isValidSchemedUrl)
        XCTAssert("ftp://google.com".isValidSchemedUrl)
        XCTAssertFalse("google.com".isValidSchemedUrl)
    }
    
    func testIsValidHttpsUrl() {
        XCTAssertFalse("Hello world!".isValidHttpsUrl)
        XCTAssert("https://google.com".isValidHttpsUrl)
        XCTAssertFalse("http://google.com".isValidHttpsUrl)
        XCTAssertFalse("google.com".isValidHttpsUrl)
    }
    
    func testIsValidHttpUrl() {
        XCTAssertFalse("Hello world!".isValidHttpUrl)
        XCTAssert("http://google.com".isValidHttpUrl)
        XCTAssertFalse("google.com".isValidHttpUrl)
    }
    
    func testIsValidFileURL() {
        XCTAssertFalse("Hello world!".isValidFileUrl)
        XCTAssert("file://var/folder/file.txt".isValidFileUrl)
        XCTAssertFalse("google.com".isValidFileUrl)
    }
    
    func testIsDigits() {
        XCTAssert("123".isDigits)
        XCTAssert("987654321".isDigits)
        XCTAssertFalse("123.4".isDigits)
        XCTAssertFalse("1.25e2".isDigits)
        XCTAssertFalse("123abc".isDigits)
    }
    
    func testBool() {
        XCTAssertNotNil("1".bool)
        XCTAssert("1".bool!)
        
        XCTAssertNotNil("false".bool)
        XCTAssertFalse("false".bool!)
        XCTAssertNil("8s".bool)
    }
    
    func testInt() {
        XCTAssertNotNil("8".int)
        XCTAssertEqual("8".int, 8)
        
        XCTAssertNil("8s".int)
    }
    
    func testUrl() {
        XCTAssertNil("hello world".url)
        
        let google = "https://www.google.com"
        XCTAssertEqual(google.url, URL(string: google))
    }
    
    func testUrlDecoded() {
        XCTAssertEqual("it's%20easy%20to%20encode%20strings".urlDecoded, "it's easy to encode strings")
        XCTAssertEqual("%%".urlDecoded, "%%")
    }
    
    func testUrlEncoded() {
        XCTAssertEqual("it's easy to encode strings".urlEncoded, "it's%20easy%20to%20encode%20strings")
    }
    
    func testIsWhiteSpaces() {
        var str = "test string"
        XCTAssertEqual(str.isWhitespace, false)
        
        str = "     "
        XCTAssertEqual(str.isWhitespace, true)
        
        str = "   \n \n  "
        XCTAssertEqual(str.isWhitespace, true)
    }
    
    func testFloat() {
        XCTAssertNotNil("8".float())
        XCTAssertEqual("8".float(), 8)
        
        XCTAssertNotNil("8.23".float(locale: Locale(identifier: "en_US_POSIX")))
        XCTAssertEqual("8.23".float(locale: Locale(identifier: "en_US_POSIX")), Float(8.23))
        
        XCTAssertNil("8s".float())
    }
    
    func testDouble() {
        XCTAssertNotNil("8".double())
        XCTAssertEqual("8".double(), 8)
        
        XCTAssertNotNil("8.23".double(locale: Locale(identifier: "en_US_POSIX")))
        XCTAssertEqual("8.23".double(locale: Locale(identifier: "en_US_POSIX")), 8.23)
        
        XCTAssertNil("8s".double())
    }
    
    func testCgFloat() {
        XCTAssertNotNil("8".cgFloat())
        XCTAssertEqual("8".cgFloat(), 8)
        
        XCTAssertNotNil("8.23".cgFloat(locale: Locale(identifier: "en_US_POSIX")))
        XCTAssertEqual("8.23".cgFloat(locale: Locale(identifier: "en_US_POSIX")), CGFloat(8.23))
        
        XCTAssertNil("8s".cgFloat())
    }
    
    func testLines() {
        XCTAssertEqual("Hello\ntest".lines(), ["Hello", "test"])
    }
    
    func testLocalized() {
        XCTAssertEqual(helloWorld.localized(), NSLocalizedString(helloWorld, comment: ""))
        XCTAssertEqual(helloWorld.localized(comment: "comment"), NSLocalizedString(helloWorld, comment: "comment"))
    }
    
    func testSubscript() {
        let str = "Hello world!"
        XCTAssertEqual(str[safe: 1], "e")
        XCTAssertNil(str[safe: 18])
        
        XCTAssertEqual(str[safe: 1..<5], "ello")
        XCTAssertNil(str[safe: 10..<18])
        XCTAssertNil(""[safe: 1..<2])
        
        XCTAssertEqual(str[safe: 0...4], "Hello")
        XCTAssertNil(str[safe: 10...18])
        XCTAssertNil(""[safe: 1...2])
    }
    
    func testCopyToPasteboard() {
        let str = "Hello world!"
        #if os(iOS)
        str.copyToPasteboard()
        let strFromPasteboard = UIPasteboard.general.string
        XCTAssertEqual(strFromPasteboard, str)
        
        #elseif os(macOS)
        str.copyToPasteboard()
        let strFromPasteboard = NSPasteboard.general.string(forType: .string)
        XCTAssertEqual(strFromPasteboard, str)
        #endif
    }
    
    func testContain() {
        XCTAssert("Hello Tests".contains("Hello", caseSensitive: true))
        XCTAssert("Hello Tests".contains("hello", caseSensitive: false))
    }
    
    func testCount() {
        XCTAssertEqual("Hello This Tests".count(of: "T"), 2)
        XCTAssertEqual("Hello This Tests".count(of: "t"), 1)
        XCTAssertEqual("Hello This Tests".count(of: "T", caseSensitive: false), 3)
        XCTAssertEqual("Hello This Tests".count(of: "t", caseSensitive: false), 3)
    }
    
    func testRandom() {
        let str1 = String.random(ofLength: 10)
        XCTAssertEqual(str1.count, 10)
        
        let str2 = String.random(ofLength: 10)
        XCTAssertEqual(str2.count, 10)
        
        XCTAssertNotEqual(str1, str2)
        
        XCTAssertEqual(String.random(ofLength: 0), "")
    }
    
    func testReverse() {
        var str = "Hello"
        str.reverse()
        XCTAssertEqual(str, "olleH")
    }
    
    func testSlice() {
        XCTAssertEqual("12345678".slicing(from: 2, length: 3), "345")
        XCTAssertEqual("12345678".slicing(from: 2, length: 0), "")
        XCTAssertNil("12345678".slicing(from: 12, length: 0))
        XCTAssertEqual("12345678".slicing(from: 2, length: 100), "345678")
        
        var str = "12345678"
        str.slice(from: 2, length: 3)
        XCTAssertEqual(str, "345")
        
        str = "12345678"
        str.slice(from: 2, length: 0)
        print(str)
        XCTAssertEqual(str, "")
        
        str = "12345678"
        str.slice(from: 12, length: 0)
        XCTAssertEqual(str, "12345678")
        
        str = "12345678"
        str.slice(from: 2, length: 100)
        XCTAssertEqual(str, "345678")
        
        str = "12345678"
        str.slice(from: 2, to: 5)
        XCTAssertEqual(str, "345")
        
        str = "12345678"
        str.slice(from: 2, to: 1)
        XCTAssertEqual(str, "12345678")
        
        str = "12345678"
        str.slice(at: 2)
        XCTAssertEqual(str, "345678")
        
        str = "12345678"
        str.slice(at: 20)
        XCTAssertEqual(str, "12345678")
    }
    
    func testDateWithFormat() {
        let dateString = "2012-12-08 17:00:00.0"
        let date = dateString.date(withFormat: "yyyy-dd-MM HH:mm:ss.S")
        XCTAssertNotNil(date)
        XCTAssertNil(dateString.date(withFormat: "Hello world!"))
    }
    
    func testTruncate() {
        var str = "This is a very long sentence"
        str.truncate(toLength: 14)
        XCTAssertEqual(str, "This is a very...")
        
        str = "This is a very long sentence"
        str.truncate(toLength: 14, trailing: nil)
        XCTAssertEqual(str, "This is a very")
        
        str = "This is a short sentence"
        str.truncate(toLength: 100)
        XCTAssertEqual(str, "This is a short sentence")
        
        str.truncate(toLength: -1)
        XCTAssertEqual(str, "This is a short sentence")
    }
    
    func testTruncated() {
        XCTAssertEqual("This is a very long sentence".truncated(toLength: 14), "This is a very...")
        
        XCTAssertEqual("This is a very long sentence".truncated(toLength: 14, trailing: nil), "This is a very")
        XCTAssertEqual("This is a short sentence".truncated(toLength: 100), "This is a short sentence")
    }
    
    func testUrlDecode() {
        var url = "it's%20easy%20to%20encode%20strings"
        url.urlDecode()
        XCTAssertEqual(url, "it's easy to encode strings")
    }
    
    func testUrlEncode() {
        var url = "it's easy to encode strings"
        url.urlEncode()
        XCTAssertEqual(url, "it's%20easy%20to%20encode%20strings")
    }
    
    func testPadStart() {
        var str: String = "str"
        str.padStart(10)
        XCTAssertEqual(str, "       str")
        
        str = "str"
        str.padStart(10, with: "br")
        XCTAssertEqual(str, "brbrbrbstr")
        
        str = "str"
        str.padStart(5, with: "brazil")
        XCTAssertEqual(str, "brstr")
        
        str = "str"
        str.padStart(6, with: "a")
        XCTAssertEqual(str, "aaastr")
        
        str = "str"
        str.padStart(6, with: "abc")
        XCTAssertEqual(str, "abcstr")
        
        str = "str"
        str.padStart(2)
        XCTAssertEqual(str, "str")
    }
    
    func testPaddingStart() {
        XCTAssertEqual("str".paddingStart(10), "       str")
        XCTAssertEqual("str".paddingStart(10, with: "br"), "brbrbrbstr")
        XCTAssertEqual("str".paddingStart(5, with: "brazil"), "brstr")
        XCTAssertEqual("str".paddingStart(6, with: "a"), "aaastr")
        XCTAssertEqual("str".paddingStart(6, with: "abc"), "abcstr")
        XCTAssertEqual("str".paddingStart(2), "str")
    }
    
    func testPadEnd() {
        var str: String = "str"
        str.padEnd(10)
        XCTAssertEqual(str, "str       ")
        
        str = "str"
        str.padEnd(10, with: "br")
        XCTAssertEqual(str, "strbrbrbrb")
        
        str = "str"
        str.padEnd(5, with: "brazil")
        XCTAssertEqual(str, "strbr")
        
        str = "str"
        str.padEnd(6, with: "a")
        XCTAssertEqual(str, "straaa")
        
        str = "str"
        str.padEnd(6, with: "abc")
        XCTAssertEqual(str, "strabc")
        
        str = "str"
        str.padEnd(2)
        XCTAssertEqual(str, "str")
    }
    
    func testPaddingEnd() {
        XCTAssertEqual("str".paddingEnd(10), "str       ")
        XCTAssertEqual("str".paddingEnd(10, with: "br"), "strbrbrbrb")
        XCTAssertEqual("str".paddingEnd(5, with: "brazil"), "strbr")
        XCTAssertEqual("str".paddingEnd(6, with: "a"), "straaa")
        XCTAssertEqual("str".paddingEnd(6, with: "abc"), "strabc")
        XCTAssertEqual("str".paddingEnd(2), "str")
    }
    
    func testInitFromBase64() {
        XCTAssertNotNil(String(base64: "SGVsbG8gV29ybGQh"))
        XCTAssertEqual(String(base64: "SGVsbG8gV29ybGQh"), "Hello World!")
        XCTAssertNil(String(base64: "hello"))
    }
    
    func testInitRandomOfLength() {
        let str1 = String(randomOfLength: 10)
        XCTAssertEqual(str1.count, 10)
        
        let str2 = String(randomOfLength: 10)
        XCTAssertEqual(str2.count, 10)
        
        XCTAssertNotEqual(str1, str2)
        
        XCTAssertEqual(String(randomOfLength: 0), "")
    }
    
    #if !os(tvOS) && !os(watchOS)
    func testBold() {
        let boldString = "hello".bold
        let attrs = boldString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, boldString.length))
        XCTAssertNotNil(attrs[NSAttributedString.Key.font])
        
        #if os(macOS)
        guard let font = attrs[.font] as? NSFont else {
            XCTFail("Unable to find font in testBold")
            return
        }
        XCTAssertEqual(font, NSFont.boldSystemFont(ofSize: NSFont.systemFontSize))
        #elseif os(iOS)
        guard let font = attrs[NSAttributedString.Key.font] as? UIFont else {
            XCTFail("Unable to find font in testBold")
            return
        }
        XCTAssertEqual(font, UIFont.boldSystemFont(ofSize: UIFont.systemFontSize))
        #endif
    }
    #endif
    
    func testUnderline() {
        let underlinedString = "hello".underline
        let attrs = underlinedString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, underlinedString.length))
        XCTAssertNotNil(attrs[NSAttributedString.Key.underlineStyle])
        guard let style = attrs[NSAttributedString.Key.underlineStyle] as? Int else {
            XCTFail("Unable to find style in testUnderline")
            return
        }
        XCTAssertEqual(style, NSUnderlineStyle.single.rawValue)
    }
    
    func testStrikethrough() {
        let strikedthroughString = "hello".strikethrough
        let attrs = strikedthroughString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, strikedthroughString.length))
        XCTAssertNotNil(attrs[NSAttributedString.Key.strikethroughStyle])
        guard let style = attrs[NSAttributedString.Key.strikethroughStyle] as? NSNumber else {
            XCTFail("Unable to find style in testStrikethrough")
            return
        }
        XCTAssertEqual(style, NSNumber(value: NSUnderlineStyle.single.rawValue as Int))
    }
    
    #if os(iOS)
    func testItalic() {
        let italicString = "hello".italic
        let attrs = italicString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, italicString.length))
        XCTAssertNotNil(attrs[NSAttributedString.Key.font])
        guard let font = attrs[NSAttributedString.Key.font] as? UIFont else {
            XCTFail("Unable to find font in testItalic")
            return
        }
        XCTAssertEqual(font, UIFont.italicSystemFont(ofSize: UIFont.systemFontSize))
    }
    #endif
    
    func testColored() {
        let coloredString = "hello".colored(with: .orange)
        let attrs = coloredString.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, coloredString.length))
        XCTAssertNotNil(attrs[NSAttributedString.Key.foregroundColor])
        
        #if os(macOS)
        guard let color = attrs[.foregroundColor] as? NSColor else {
            XCTFail("Unable to find color in testColored")
            return
        }
        XCTAssertEqual(color, NSColor.orange)
        #else
        guard let color = attrs[NSAttributedString.Key.foregroundColor] as? UIColor else {
            XCTFail("Unable to find color in testColored")
            return
        }
        XCTAssertEqual(color, UIColor.orange)
        #endif
    }
    
    func testNSString() {
        XCTAssertEqual("Hello".nsString, NSString(string: "Hello"))
    }
    
    func testLastPathComponent() {
        let string = "hello"
        let nsString = NSString(string: "hello")
        XCTAssertEqual(string.lastPathComponent, nsString.lastPathComponent)
    }
    
    func testLastPathExtension() {
        let string = "hello"
        let nsString = NSString(string: "hello")
        XCTAssertEqual(string.pathExtension, nsString.pathExtension)
    }
    
    func testLastDeletingLastPathComponent() {
        let string = "hello"
        let nsString = NSString(string: "hello")
        XCTAssertEqual(string.deletingLastPathComponent, nsString.deletingLastPathComponent)
    }
    
    func testLastDeletingPathExtension() {
        let string = "hello"
        let nsString = NSString(string: "hello")
        XCTAssertEqual(string.deletingPathExtension, nsString.deletingPathExtension)
    }
    
    func testLastPathComponents() {
        let string = "hello"
        let nsString = NSString(string: "hello")
        XCTAssertEqual(string.pathComponents, nsString.pathComponents)
    }
    
    func testAppendingPathComponent() {
        let string = "hello".appendingPathComponent("world")
        let nsString = NSString(string: "hello").appendingPathComponent("world")
        XCTAssertEqual(string, nsString)
    }
    
    func testAppendingPathExtension() {
        let string = "hello".appendingPathExtension("world")
        let nsString = NSString(string: "hello").appendingPathExtension("world")
        XCTAssertEqual(string, nsString)
    }
    
    
    func testCryptoAlgorithm() {
        let string = "123456"
        let addString = "56789"
        XCTAssertEqual(string.sha1, "7c4a8d09ca3762af61e59520943dc26494f8941b")
        XCTAssertEqual(string.sha224, "f8cdb04495ded47615258f9dc6a3f4707fd2405434fefc3cbf4ef4e6")
        XCTAssertEqual(string.sha256, "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92")
        XCTAssertEqual(string.sha384, "0a989ebc4a77b56a6e2bb7b19d995d185ce44090c13e2984b7ecc6d446d4b61ea9991b76a4c2f04b1b4d244841449454")
        XCTAssertEqual(string.sha512, "ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413")
        XCTAssertEqual(string.md5, "e10adc3949ba59abbe56e057f20f883e")

        XCTAssertEqual(string.hmac(.sha1, key: addString), "00b5f91295d6b9dc9513fa7d5a860385524095a9")
        XCTAssertEqual(string.hmac(.sha224, key: addString), "bd839baf51e91e31bca965d9f43c13b991dc3445e0309489287c2e88")
        XCTAssertEqual(string.hmac(.sha256, key: addString), "23cb6d4922ce2d8495d57ba6b3dc2ec4ff87282b13a3f71d5746656516260a8d")
        XCTAssertEqual(string.hmac(.sha384, key: addString), "684d4d43a98a2443c4806343e1237399e2b8289d6100ba1418694893be102fbae1e3c1f270a22736239f716a12681520")
        XCTAssertEqual(string.hmac(.sha512, key: addString), "14587c7e074eb67f89dd66a0d57ecfde671eaf738303b96f814e2acc6aec4ef1f39cae87333597cf06016d93dc35053fecbe0810080dceb4aae918c26c266c09")
        XCTAssertEqual(string.hmac(.md5, key: addString), "449e1de7b64474adff24b02981788909")
    }
}
