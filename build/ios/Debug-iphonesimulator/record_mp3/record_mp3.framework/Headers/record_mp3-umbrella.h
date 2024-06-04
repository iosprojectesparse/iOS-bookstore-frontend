#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "lame.h"
#import "Mp3EncodeOperation.h"
#import "Mp3RecordingClient.h"
#import "Recorder.h"
#import "RecordMp3Plugin.h"

FOUNDATION_EXPORT double record_mp3VersionNumber;
FOUNDATION_EXPORT const unsigned char record_mp3VersionString[];

