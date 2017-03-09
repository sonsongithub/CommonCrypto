import Foundation
import CCommonCrypto

extension String {
    public func sha256(with key: String) -> String {
        let stringlength = (self as NSString).lengthOfBytes(using: String.Encoding.utf8.rawValue)
        var stringbuffer = [UInt8](repeating: 0, count: stringlength)
        (self as NSString).getBytes(&stringbuffer, maxLength: stringlength, usedLength: nil, encoding: String.Encoding.utf8.rawValue, options: [], range: NSRange(location: 0, length: self.utf16.count), remaining: nil)

        let keylength = (self as NSString).lengthOfBytes(using: String.Encoding.utf8.rawValue)
        var keybuffer = [UInt8](repeating: 0, count: keylength)
        (key as NSString).getBytes(&keybuffer, maxLength: keylength, usedLength: nil, encoding: String.Encoding.utf8.rawValue, options: [], range: NSRange(location: 0, length: key.utf16.count), remaining: nil)


        var digestbuffer = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))

        var hmacContext = CCHmacContext()
        CCHmacInit(&hmacContext, CCHmacAlgorithm(kCCHmacAlgSHA256), keybuffer, keylength)
        CCHmacUpdate(&hmacContext, stringbuffer, stringlength)
        CCHmacFinal(&hmacContext, &digestbuffer)
        return ""
    }
}

//    unsigned int stringLength = (unsigned int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
//    unsigned char *string = (unsigned char*)malloc(sizeof(unsigned char) * stringLength);
//
//    unsigned int keyLength = (unsigned int)[keyword lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
//    unsigned char *key = (unsigned char*)malloc(sizeof(unsigned char) * keyLength);
//
//    [self getBytes:string maxLength:stringLength usedLength:NULL encoding:NSUTF8StringEncoding options:0 range:NSMakeRange(0, self.length) remainingRange:NULL];
//    [keyword getBytes:key maxLength:keyLength usedLength:NULL encoding:NSUTF8StringEncoding options:0 range:NSMakeRange(0, keyword.length) remainingRange:NULL];
//
//    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
//    CCHmacContext hmacContext;
//    CCHmacInit(&hmacContext, kCCHmacAlgSHA256, key, keyLength);
//    CCHmacUpdate(&hmacContext, string, stringLength);
//    CCHmacFinal(&hmacContext, digest);
//
//    NSMutableString *hash = [NSMutableString string];
//
//    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
//    [hash appendFormat:@"%02x", *(digest + i)];
//
//    free(key);
//    free(string);
//    return [NSString stringWithString:hash];
