//
//  NSImage+Overlay.m
//  OverlayIcon
//
//  Created by Amber2020 on 11/24/11.
//  Copyright (c) 2020. All rights reserved.
//

#import "NSImage+Overlay.h"
#import <QuickLook/QuickLook.h>

@implementation NSImage (Overlay)


+ (NSImage *) quickLookImageOfFile:(NSString *) filePath withOverlayImage:(NSImage *) overlayImage withIconSize:(CGSize) size  overlayFrame:(CGRect) frame {

    if(!filePath) 
        return nil;
    
    NSURL *sourceFileURL = [NSURL fileURLWithPath:filePath];

    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],(NSString *) kQLThumbnailOptionIconModeKey, nil];
    
    CGImageRef qlImageRef = QLThumbnailImageCreate(kCFAllocatorDefault, (__bridge CFURLRef) sourceFileURL, size, (__bridge CFDictionaryRef) options);
    
    if(qlImageRef)
    {
    
        NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:qlImageRef];
        
        NSImage *compositeImage = nil, *qlIconImage = nil;
        
        if(bitmap) {
        
            qlIconImage = [[NSImage alloc] initWithSize:bitmap.size];
            
            [qlIconImage addRepresentation:bitmap];
            
            if(qlIconImage) {
                
                compositeImage = [[NSImage alloc] initWithSize:size];
                
                [compositeImage lockFocus];
                
                [qlIconImage drawInRect:NSMakeRect(0, 0, size.width, size.height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
                
                [overlayImage drawInRect:frame fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
                
                [compositeImage unlockFocus];
                
                
                return compositeImage;
            }
            
            else
                return nil;
        
        }
        else
            return nil;
        
    
    }
    else 
        return nil;
    
}

@end
