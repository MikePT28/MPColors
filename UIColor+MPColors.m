//
//  UIColor+MPColors.m
//  MPColors
//
//  Created by Mike Pesate on 2/8/15.
//  Copyright (c) 2015 Mike Pesate.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

#import "UIColor+MPColors.h"

#pragma mark - Static Constants

static float kMP_Base255 = 255.f;

static const int32_t kMP_HexRGB_R = 0xFF0000;
static const int32_t kMP_HexRGB_G = 0xFF00;
static const int32_t kMP_HexRGB_B = 0xFF;

static const uInt kMP_HexShiftRGB_R = 16;
static const uInt kMP_HexShiftRGB_G = 8;
static const uInt kMP_HexShiftRGB_B = 0;

static const int32_t kMP_HexRGBA_R = 0xFF000000;
static const int32_t kMP_HexRGBA_G = 0xFF0000;
static const int32_t kMP_HexRGBA_B = 0xFF00;
static const int32_t kMP_HexRGBA_A = 0xFF;

static const uInt kMP_HexShiftRGBA_R = 24;
static const uInt kMP_HexShiftRGBA_G = 16;
static const uInt kMP_HexShiftRGBA_B = 8;
static const uInt kMP_HexShiftRGBA_A = 0;


@implementation UIColor (MPColors)

#pragma mark - Shorthand Methods

+(UIColor *)mp_shorthandColorWithRGBArray:(NSArray*)rgb{
    
    if (rgb.count != 3) {
        return nil;
    }
    
    float red = [rgb[0] floatValue];
    float green = [rgb[1] floatValue];
    float blue = [rgb[2] floatValue];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+(UIColor *)mp_shorthandColorWithRGBAArray:(NSArray*)rgba{
    
    if (rgba.count != 4) {
        return nil;
    }
    
    float red = [rgba[0] floatValue];
    float green = [rgba[1] floatValue];
    float blue = [rgba[2] floatValue];
    float alpha = [rgba[3] floatValue];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    return nil;
}

#pragma mark - Base255 Support Methods

+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue{
    return  [self mp_colorWithRed255:red withGreen255:green withBlue255:blue withAlpha:1.0];
}


+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue withAlpha:(CGFloat)alpha{
    if (red > 255 || blue >255 || blue > 255 || alpha > 1.f) {
        return nil;
    }
    
    float fRed   = (float)red/kMP_Base255;
    float fGreen = (float)green/kMP_Base255;
    float fBlue  = (float)blue/kMP_Base255;
    
    UIColor* color = [UIColor colorWithRed:fRed green:fGreen blue:fBlue alpha:alpha];
    

    
    return color;
    
}

+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue withAlpha100:(uInt)alpha{
    
    float fAlpha = (float)alpha/100.f;
    
    return [self mp_colorWithRed255:red withGreen255:green withBlue255:blue withAlpha:fAlpha];
}

+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255FromRBGAString:(NSString*)rgbString{
    NSArray* colors = [rgbString componentsSeparatedByString:@","];
    if (colors.count < 3) {
        return nil;
    }
    
    uInt red = (uInt)[(NSString*)[colors objectAtIndex:0] intValue];
    uInt green = (uInt)[(NSString*)[colors objectAtIndex:1] intValue];
    uInt blue = (uInt)[(NSString*)[colors objectAtIndex:2] intValue];
    
    return [self mp_colorWithRed255:red withGreen255:green withBlue255:blue];

}

+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255WithFloatAlphaFromRBGAString:(NSString*)rgbaString{
    
    NSArray* colors = [rgbaString componentsSeparatedByString:@","];
    if (colors.count < 4) {
        return nil;
    }
    
    uInt red = (uInt)[(NSString*)[colors objectAtIndex:0] intValue];
    uInt green = (uInt)[(NSString*)[colors objectAtIndex:1] intValue];
    uInt blue = (uInt)[(NSString*)[colors objectAtIndex:2] intValue];
    float alpha = (float)[(NSString*)[colors objectAtIndex:3] floatValue];

    return [self mp_colorWithRed255:red withGreen255:green withBlue255:blue withAlpha:alpha];
}

+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255WithAlpha100FromRBGAString:(NSString*)rgbaString{
    
    NSArray* colors = [rgbaString componentsSeparatedByString:@","];
    if (colors.count < 4) {
        return nil;
    }
    
    uInt red = (uInt)[(NSString*)[colors objectAtIndex:0] intValue];
    uInt green = (uInt)[(NSString*)[colors objectAtIndex:1] intValue];
    uInt blue = (uInt)[(NSString*)[colors objectAtIndex:2] intValue];
    uInt alpha = (uInt)[(NSString*)[colors objectAtIndex:3] intValue];
    
    return [self mp_colorWithRed255:red withGreen255:green withBlue255:blue withAlpha100:alpha];
}

#pragma mark -  HexRGB and HexRGBA Support Methods

+(UIColor *)mp_colorFromHexRBG:(int32_t)rgbHex{
    
    float red = (float)((rgbHex & kMP_HexRGB_R) >> kMP_HexShiftRGB_R) / kMP_Base255;
    float green = (float)((rgbHex & kMP_HexRGB_G) >> kMP_HexShiftRGB_G) / kMP_Base255;
    float blue = (float)((rgbHex & kMP_HexRGB_B) >> kMP_HexShiftRGB_B) / kMP_Base255;
    float alpha = 1.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
}

+(UIColor *)mp_colorFromHexRBGA:(int32_t)rgbaHex{
    float red = (float)((rgbaHex & kMP_HexRGBA_R) >> kMP_HexShiftRGBA_R) / kMP_Base255;
    float green = (float)((rgbaHex & kMP_HexRGBA_G) >> kMP_HexShiftRGBA_G) / kMP_Base255;
    float blue = (float)((rgbaHex & kMP_HexRGBA_B) >> kMP_HexShiftRGBA_B) / kMP_Base255;
    float alpha = (float)((rgbaHex & kMP_HexRGBA_A) >> kMP_HexShiftRGBA_A) / kMP_Base255;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor *)mp_colorFromHexRBGString:(NSString *)rgbHexString{
    
    uint32_t hexRGB = 0;
    
    rgbHexString =[rgbHexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:rgbHexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    BOOL scanned = [scanner scanHexInt:&hexRGB];
    if (!scanned) {
        return nil;
    }
    return [self mp_colorFromHexRBG:hexRGB];
    
}

+(UIColor *)mp_colorFromHexRBGAString:(NSString *)rgbaHexString{
    
    uint32_t hexRGBA = 0;
    
    rgbaHexString =[rgbaHexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:rgbaHexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    BOOL scanned = [scanner scanHexInt:&hexRGBA];
    if (!scanned) {
        return nil;
    }
    return [self mp_colorFromHexRBGA:hexRGBA];
    
}

@end
