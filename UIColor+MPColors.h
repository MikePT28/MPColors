//
//  UIColor+MPColors.h
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

#import <UIKit/UIKit.h>

/**
 * Shorter def for unsigned int.
 **/
typedef unsigned int uInt;

@interface UIColor (MPColors)

#pragma mark - Shorthand Methods

/** ****************************************************
 * @name Shorthand Methods
 ** ****************************************************/

/**
*  Creates color from array of floats (0.0 - 1.0).
*  @param rgb NSArray of float literals @[@1.0,@1.0,@1.0].
*  @return The UIColor instance or nil if conditions are not met.
*/
+(UIColor*)mp_shorthandColorWithRGBArray:(NSArray*)rgb;

/**
 *  Creates color from array of floats (0.0 - 1.0).
 *  @param rgba NSArray of float literals @[@1.0,@1.0,@1.0,@1.0].
 *  @return The UIColor instance or nil if conditions are not met.
 */
+(UIColor*)mp_shorthandColorWithRGBAArray:(NSArray*)rgba;

#pragma mark - Base255 Support Methods

/** ****************************************************
 * @name Base255 Support
 ** ****************************************************/

/**
* Creates a color from integers (0 - 255).
* @param red The red value of the color (0-255).
* @param green The green value of the color (0-255).
* @param blue The blue value of the color (0-255).
* @return The 'UIColor' instance or nil if conditions are not met.
**/
+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue;

/**
 * Creates a color from integers (0 - 255). Alpha still a CGFloat (0.0 - 1.0).
 * @param red The red value of the color (0-255).
 * @param green The green value of the color (0-255).
 * @param blue The blue value of the color (0-255).
 * @param alpha The alpha value for the color (0.0 - 1.0).
 * @return The 'UIColor' instance or nil if conditions are not met.
 **/
+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue withAlpha:(CGFloat)alpha;
/**
 * Creates a color from integers (0 - 255). Alpha from (0-100)
 * @param red The red value of the color (0-255).
 * @param green The green value of the color (0-255).
 * @param blue The blue value of the color (0-255).
 * @param alpha The alpha value for the color (0 - 100).
 * @return The 'UIColor' instance or nil if conditions are not met.
 **/
+(UIColor*)mp_colorWithRed255:(uInt)red withGreen255:(uInt)green withBlue255:(uInt)blue withAlpha100:(uInt)alpha;

/**
 * Creates a color from a rbgString.
 * @param rbgaString String containing the rgb value of the color, separated by commas from 0-255 (Ex: @"255,0,0 - Red).
 * @return The 'UIColor' instance or nil if conditions are not met.
 **/
+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255FromRBGAString:(NSString*)rgbString;

/**
 * Creates a color from a rbgaString.
 * @param rbgaString String containing the rgba value of the color, separated by commas from 0-255, and a float alpha from 0.0-1.0 (Ex: @"255,0,0,1.0" - Full Red).
 * @return The 'UIColor' instance or nil if conditions are not met.
 **/
+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255WithFloatAlphaFromRBGAString:(NSString*)rgbaString;

/**
 * Creates a color from a rbgaString.
 * @param rbgaString String containing the rgba value of the color, separated by commas from 0-255, and a unsigned int alpha from 0-100 (Ex: @"255,0,0,100" - Full Red).
 * @return The 'UIColor' instance or nil if conditions are not met.
 **/
+(UIColor*)mp_colorWithRed255WithGreen255WithBlue255WithAlpha100FromRBGAString:(NSString*)rgbaString;

#pragma mark -  HexRGB and HexRGBA Support Methods

/** ****************************************************
 * @name HexRBG & HexRGBA Support
 ** ****************************************************/

/**
 *  Creates a color from a Hex value
 *  @param rgbHex Hex value of an RGB Color Ex: 0xFFCC11
 *  @return The 'UIColor' instance or nil if conditions are not met.
 */
+(UIColor*)mp_colorFromHexRBG:(int32_t)rgbHex;

/**
 *  Creates a color from a Hex value
 *  @param rgbaHex Hex value of an RGB Color Ex: 0xFFCC11FF
 *  @return The 'UIColor' instance or nil if conditions are not met.
 */
+(UIColor*)mp_colorFromHexRBGA:(int32_t)rgbaHex;


/**
 *  Creates a color from a String containing a Hex value
 *  @param rgbHexString String with Hex value of an RGB Color Ex: @"FF00FF" or @"#FF00FF" or @"0xFF00FF"
 *  @return The 'UIColor' instance or nil if conditions are not met.
 */
+(UIColor*)mp_colorFromHexRBGString:(NSString*)rgbHexString;


/**
 *  Creates a color from a String containing a Hex value
 *  @param rgbaHexString String with Hex value of an RGBA Color Ex: @"FF00FFFF" or @"#FF00FFFF" or @"0xFF00FFFF"
 *  @return The 'UIColor' instance or nil if conditions are not met.
 */
+(UIColor*)mp_colorFromHexRBGAString:(NSString *)rgbaHexString;


@end
