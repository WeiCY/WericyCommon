//
//  WeicySystemSoundTool.m
//  Common
//
//  Created by CityDoWCY on 2021/2/1.
//

#import "WeicySystemSoundTool.h"

@implementation WeicySystemSoundTool

+ (void)weicy_playSystemSound:(AudioID)audioID {
    AudioServicesPlaySystemSound((SystemSoundID)audioID);
}

+ (void)weicy_playSystemSoundVibrate {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (SystemSoundID)weicy_playCustomSound:(NSURL * _Nonnull)soundURL {
    SystemSoundID soundID;
    
    OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &soundID);
    if (error != kAudioServicesNoError) {
        NSLog(@"Could not load %@", soundURL);
    }
    return soundID;
}

+ (BOOL)weicy_disposeSound:(SystemSoundID)soundID {
    OSStatus error = AudioServicesDisposeSystemSoundID(soundID);
    if (error != kAudioServicesNoError) {
        NSLog(@"Error while disposing sound %i", (unsigned int)soundID);
        return NO;
    }
    
    return YES;
}

@end
