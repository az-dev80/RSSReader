//
//  DateFormatterStringToString.m
//  RSS Reader
//
//  Created by Albert Zhloba on 2.05.22.
//

#import "DateFormatterStringToString.h"
#import "Constants.h"

@implementation DateFormatterStringToString

+(NSString *)formattedDate:(NSString *)parsedDateString {
    static NSDateFormatter *inputFormatter = nil;
    static NSDateFormatter *outputFormatter = nil;
    if (!inputFormatter) {
        inputFormatter = [[NSDateFormatter alloc] init];
        inputFormatter.locale = [NSLocale localeWithLocaleIdentifier:DATE_FORMAT_LOCALE];
        [inputFormatter setDateFormat:DATE_FORMAT_INPUT];
        
        outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:DATE_FORMAT_OUTPUT];
    }

    NSDate *date = [inputFormatter dateFromString:parsedDateString];
    return [outputFormatter stringFromDate:date];
}

//+(NSString *)formattedDate:(NSString *)parsedDateString {
//    static NSDateFormatter *formatter = nil;
//    if (!formatter) {
//        formatter = [[NSDateFormatter alloc] init];
//        formatter.locale = [NSLocale localeWithLocaleIdentifier:DATE_FORMAT_LOCALE];
//    }
//    [formatter setDateFormat:DATE_FORMAT_INPUT];
//    NSDate *date = [formatter dateFromString:parsedDateString];
//    [formatter setDateFormat:DATE_FORMAT_OUTPUT];
//    return [formatter stringFromDate:date];
//}

@end
