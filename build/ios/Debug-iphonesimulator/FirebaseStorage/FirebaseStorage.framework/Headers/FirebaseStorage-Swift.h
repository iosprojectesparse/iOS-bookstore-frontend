#if 0
#elif defined(__x86_64__) && __x86_64__
// Generated by Apple Swift version 5.7.2 (swiftlang-5.7.2.135.5 clang-1400.0.29.51)
#ifndef FIREBASESTORAGE_SWIFT_H
#define FIREBASESTORAGE_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wduplicate-method-match"
#pragma clang diagnostic ignored "-Wauto-import"
#if defined(__OBJC__)
#include <Foundation/Foundation.h>
#endif
#if defined(__cplusplus)
#include <cstdint>
#include <cstddef>
#include <cstdbool>
#else
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#endif

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if defined(__OBJC__)
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if !defined(SWIFT_CALL)
# define SWIFT_CALL __attribute__((swiftcall))
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT noexcept
#endif
#else
#if !defined(SWIFT_NOEXCEPT)
# define SWIFT_NOEXCEPT 
#endif
#endif
#if defined(__cplusplus)
#if !defined(SWIFT_CXX_INT_DEFINED)
#define SWIFT_CXX_INT_DEFINED
namespace swift {
using Int = ptrdiff_t;
using UInt = size_t;
}
#endif
#endif
#if defined(__OBJC__)
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import Dispatch;
@import Foundation;
@import ObjectiveC;
#endif

#endif
#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="FirebaseStorage",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

#if defined(__OBJC__)
@class NSString;
@class FIRApp;
@class FIRStorageReference;

/// Firebase Storage is a service that supports uploading and downloading binary objects,
/// such as images, videos, and other files to Google Cloud Storage. Instances of <code>Storage</code>
/// are not thread-safe.
/// If you call <code>Storage.storage()</code>, the instance will initialize with the default <code>FirebaseApp</code>,
/// <code>FirebaseApp.app()</code>, and the storage location will come from the provided
/// <code>GoogleService-Info.plist</code>.
/// If you provide a custom instance of <code>FirebaseApp</code>,
/// the storage location will be specified via the <code>FirebaseOptions.storageBucket</code> property.
SWIFT_CLASS_NAMED("Storage")
@interface FIRStorage : NSObject
/// The default <code>Storage</code> instance.
///
/// returns:
/// An instance of <code>Storage</code>, configured with the default <code>FirebaseApp</code>.
+ (FIRStorage * _Nonnull)storage SWIFT_WARN_UNUSED_RESULT;
/// A method used to create <code>Storage</code> instances initialized with a custom storage bucket URL.
/// Any <code>StorageReferences</code> generated from this instance of <code>Storage</code> will reference files
/// and directories within the specified bucket.
/// \param url The <code>gs://</code> URL to your Firebase Storage bucket.
///
///
/// returns:
/// A <code>Storage</code> instance, configured with the custom storage bucket.
+ (FIRStorage * _Nonnull)storageWithURL:(NSString * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
/// Creates an instance of <code>Storage</code>, configured with a custom <code>FirebaseApp</code>. <code>StorageReference</code>s
/// generated from a resulting instance will reference files in the Firebase project
/// associated with custom <code>FirebaseApp</code>.
/// \param app The custom <code>FirebaseApp</code> used for initialization.
///
///
/// returns:
/// A <code>Storage</code> instance, configured with the custom <code>FirebaseApp</code>.
+ (FIRStorage * _Nonnull)storageForApp:(FIRApp * _Nonnull)app SWIFT_WARN_UNUSED_RESULT;
/// Creates an instance of <code>Storage</code>, configured with a custom <code>FirebaseApp</code> and a custom storage
/// bucket URL.
/// \param app The custom <code>FirebaseApp</code> used for initialization.
///
/// \param url The <code>gs://</code> url to your Firebase Storage bucket.
///
///
/// returns:
/// the <code>Storage</code> instance, configured with the custom <code>FirebaseApp</code> and storage bucket URL.
+ (FIRStorage * _Nonnull)storageForApp:(FIRApp * _Nonnull)app URL:(NSString * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
/// The <code>FirebaseApp</code> associated with this Storage instance.
@property (nonatomic, readonly, strong) FIRApp * _Nonnull app;
/// The maximum time in seconds to retry an upload if a failure occurs.
/// Defaults to 10 minutes (600 seconds).
@property (nonatomic) NSTimeInterval maxUploadRetryTime;
/// The maximum time in seconds to retry a download if a failure occurs.
/// Defaults to 10 minutes (600 seconds).
@property (nonatomic) NSTimeInterval maxDownloadRetryTime;
/// The maximum time in seconds to retry operations other than upload and download if a failure occurs.
/// Defaults to 2 minutes (120 seconds).
@property (nonatomic) NSTimeInterval maxOperationRetryTime;
/// A <code>DispatchQueue</code> that all developer callbacks are fired on. Defaults to the main queue.
@property (nonatomic, strong) dispatch_queue_t _Nonnull callbackQueue;
/// Creates a <code>StorageReference</code> initialized at the root Firebase Storage location.
///
/// returns:
/// An instance of <code>StorageReference</code> referencing the root of the storage bucket.
- (FIRStorageReference * _Nonnull)reference SWIFT_WARN_UNUSED_RESULT;
/// Creates a StorageReference given a <code>gs://</code>, <code>http://</code>, or <code>https://</code> URL pointing to a
/// Firebase Storage location. For example, you can pass in an <code>https://</code> download URL retrieved from
/// <code>StorageReference.downloadURL(completion:)</code> or the <code>gs://</code> URL from
/// <code>StorageReference.description</code>.
/// \param url A gs // or https:// URL to initialize the reference with.
///
///
/// throws:
/// Throws a fatal error if <code>url</code> is not associated with the <code>FirebaseApp</code> used to initialize
/// this Storage instance.
///
/// returns:
/// An instance of StorageReference at the given child path.
- (FIRStorageReference * _Nonnull)referenceForURL:(NSString * _Nonnull)url SWIFT_WARN_UNUSED_RESULT;
/// Creates a <code>StorageReference</code> initialized at a location specified by the <code>path</code> parameter.
/// \param path A relative path from the root of the storage bucket, 
/// for instance @“path/to/object”.
///
///
/// returns:
/// An instance of <code>StorageReference</code> pointing to the given path.
- (FIRStorageReference * _Nonnull)referenceWithPath:(NSString * _Nonnull)path SWIFT_WARN_UNUSED_RESULT;
/// Configures the Storage SDK to use an emulated backend instead of the default remote backend.
/// This method should be called before invoking any other methods on a new instance of <code>Storage</code>.
- (void)useEmulatorWithHost:(NSString * _Nonnull)host port:(NSInteger)port;
- (id _Nonnull)copy SWIFT_WARN_UNUSED_RESULT;
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly) NSUInteger hash;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


/// Defines task operations such as pause, resume, cancel, and enqueue for all tasks.
/// All tasks are required to implement enqueue, which begins the task, and may optionally
/// implement pause, resume, and cancel, which operate on the task to pause, resume, and cancel
/// operations.
SWIFT_PROTOCOL_NAMED("StorageTaskManagement")
@protocol FIRStorageTaskManagement <NSObject>
/// Prepares a task and begins execution.
- (void)enqueue;
@optional
/// Pauses a task currently in progress.
- (void)pause;
/// Cancels a task.
- (void)cancel;
/// Resumes a paused task.
- (void)resume;
@end

@class FIRStorageTaskSnapshot;

/// A superclass to all Storage tasks, including <code>StorageUploadTask</code>
/// and <code>StorageDownloadTask</code>, to provide state transitions, event raising, and common storage
/// for metadata and errors.
/// Callbacks are always fired on the developer-specified callback queue.
/// If no queue is specified, it defaults to the main queue.
/// This class is not thread safe, so only call methods on the main thread.
SWIFT_CLASS_NAMED("StorageTask")
@interface FIRStorageTask : NSObject
/// An immutable view of the task and associated metadata, progress, error, etc.
@property (nonatomic, readonly, strong) FIRStorageTaskSnapshot * _Nonnull snapshot;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

enum FIRStorageTaskStatus : NSInteger;

/// An extended <code>StorageTask</code> providing observable semantics that can be used for responding to changes
/// in task state.
/// Observers produce a <code>StorageHandle</code>, which is used to keep track of and remove specific
/// observers at a later date.
/// This class is not thread safe and can only be called on the main thread.
SWIFT_CLASS_NAMED("StorageObservableTask")
@interface FIRStorageObservableTask : FIRStorageTask
/// Observes changes in the upload status: Resume, Pause, Progress, Success, and Failure.
/// \param status The <code>StorageTaskStatus</code> change to observe.
///
/// \param handler A callback that fires every time the status event occurs,
/// containing a <code>StorageTaskSnapshot</code> describing task state.
///
///
/// returns:
/// A task handle that can be used to remove the observer at a later date.
- (NSString * _Nonnull)observeStatus:(enum FIRStorageTaskStatus)status handler:(void (^ _Nonnull)(FIRStorageTaskSnapshot * _Nonnull))handler;
/// Removes the single observer with the provided handle.
/// \param handle The handle of the task to remove. 
///
- (void)removeObserverWithHandle:(NSString * _Nonnull)handle;
/// Removes all observers for a single status.
/// \param status A <code>StorageTaskStatus</code> to remove all listeners for.
///
- (void)removeAllObserversForStatus:(enum FIRStorageTaskStatus)status;
/// Removes all observers.
- (void)removeAllObservers;
@end


/// <code>StorageDownloadTask</code> implements resumable downloads from an object in Firebase Storage.
/// Downloads can be returned on completion with a completion handler, and can be monitored
/// by attaching observers, or controlled by calling <code>pause()</code>, <code>resume()</code>,
/// or <code>cancel()</code>.
/// Downloads can currently be returned as <code>Data</code> in memory, or as a <code>URL</code> to a file on disk.
/// Downloads are performed on a background queue, and callbacks are raised on the developer
/// specified <code>callbackQueue</code> in Storage, or the main queue if left unspecified.
/// Currently all uploads must be initiated and managed on the main queue.
SWIFT_CLASS_NAMED("StorageDownloadTask")
@interface FIRStorageDownloadTask : FIRStorageObservableTask <FIRStorageTaskManagement>
/// Prepares a task and begins execution.
- (void)enqueue;
/// Pauses a task currently in progress. Calling this on a paused task has no effect.
- (void)pause;
/// Cancels a task.
- (void)cancel;
/// Resumes a paused task. Calling this on a running task has no effect.
- (void)resume;
@end

/// Adds wrappers for common Firebase Storage errors (including creating errors from GCS errors).
/// For more information on unwrapping GCS errors, see the GCS errors docs:
/// https://cloud.google.com/storage/docs/json_api/v1/status-codes
/// This is never publicly exposed to end developers (as they will simply see an NSError).
typedef SWIFT_ENUM_NAMED(NSInteger, FIRStorageErrorCode, "StorageErrorCode", closed) {
  FIRStorageErrorCodeUnknown = -13000,
  FIRStorageErrorCodeObjectNotFound = -13010,
  FIRStorageErrorCodeBucketNotFound = -13011,
  FIRStorageErrorCodeProjectNotFound = -13012,
  FIRStorageErrorCodeQuotaExceeded = -13013,
  FIRStorageErrorCodeUnauthenticated = -13020,
  FIRStorageErrorCodeUnauthorized = -13021,
  FIRStorageErrorCodeRetryLimitExceeded = -13030,
  FIRStorageErrorCodeNonMatchingChecksum = -13031,
  FIRStorageErrorCodeDownloadSizeExceeded = -13032,
  FIRStorageErrorCodeCancelled = -13040,
  FIRStorageErrorCodeInvalidArgument = -13050,
};
static NSString * _Nonnull const FIRStorageErrorCodeDomain = @"FirebaseStorage.StorageErrorCode";


/// Contains the prefixes and items returned by a <code>StorageReference.list()</code> call.
SWIFT_CLASS_NAMED("StorageListResult")
@interface FIRStorageListResult : NSObject
/// The prefixes (folders) returned by a <code>list()</code> operation.
///
/// returns:
/// A list of prefixes (folders).
@property (nonatomic, readonly, copy) NSArray<FIRStorageReference *> * _Nonnull prefixes;
/// The objects (files) returned by a <code>list()</code> operation.
///
/// returns:
/// A page token if more results are available.
@property (nonatomic, readonly, copy) NSArray<FIRStorageReference *> * _Nonnull items;
/// Returns a token that can be used to resume a previous <code>list()</code> operation. <code>nil</code>
/// indicates that there are no more results.
///
/// returns:
/// A page token if more results are available.
@property (nonatomic, readonly, copy) NSString * _Nullable pageToken;
- (id _Nonnull)copy SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class NSDate;

/// Class which represents the metadata on an object in Firebase Storage. This metadata is
/// returned on successful operations, and can be used to retrieve download URLs, content types,
/// and a Storage reference to the object in question. Full documentation can be found at the GCS
/// Objects#resource docs.
/// @see https://cloud.google.com/storage/docs/json_api/v1/objects#resource
SWIFT_CLASS_NAMED("StorageMetadata")
@interface FIRStorageMetadata : NSObject
/// The name of the bucket containing this object.
@property (nonatomic, readonly, copy) NSString * _Nonnull bucket;
/// Cache-Control directive for the object data.
@property (nonatomic, copy) NSString * _Nullable cacheControl;
/// Content-Disposition of the object data.
@property (nonatomic, copy) NSString * _Nullable contentDisposition;
/// Content-Encoding of the object data.
@property (nonatomic, copy) NSString * _Nullable contentEncoding;
/// Content-Language of the object data.
@property (nonatomic, copy) NSString * _Nullable contentLanguage;
/// Content-Type of the object data.
@property (nonatomic, copy) NSString * _Nullable contentType;
/// MD5 hash of the data; encoded using base64.
@property (nonatomic, readonly, copy) NSString * _Nullable md5Hash;
/// The content generation of this object. Used for object versioning.
@property (nonatomic, readonly) int64_t generation;
/// User-provided metadata, in key/value pairs.
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * _Nullable customMetadata;
/// The version of the metadata for this object at this generation. Used
/// for preconditions and for detecting changes in metadata. A metageneration number is only
/// meaningful in the context of a particular generation of a particular object.
@property (nonatomic, readonly) int64_t metageneration;
/// The name of this object, in gs://bucket/path/to/object.txt, this is object.txt.
@property (nonatomic, readonly, copy) NSString * _Nullable name;
/// The full path of this object, in gs://bucket/path/to/object.txt, this is path/to/object.txt.
@property (nonatomic, readonly, copy) NSString * _Nullable path;
/// Content-Length of the data in bytes.
@property (nonatomic, readonly) int64_t size;
/// The creation time of the object in RFC 3339 format.
@property (nonatomic, readonly, copy) NSDate * _Nullable timeCreated;
/// The modification time of the object metadata in RFC 3339 format.
@property (nonatomic, readonly, copy) NSDate * _Nullable updated;
/// Never used API
@property (nonatomic, readonly, strong) FIRStorageReference * _Nullable storageReference SWIFT_DEPRECATED;
/// Creates a Dictionary from the contents of the metadata.
/// @return A Dictionary that represents the contents of the metadata.
- (NSDictionary<NSString *, NSObject *> * _Nonnull)dictionaryRepresentation SWIFT_WARN_UNUSED_RESULT;
/// Determines if the current metadata represents a “file”.
@property (nonatomic, readonly) BOOL isFile;
/// Determines if the current metadata represents a “folder”.
@property (nonatomic, readonly) BOOL isFolder;
- (nonnull instancetype)init;
/// Creates an instance of StorageMetadata from the contents of a dictionary.
/// @return An instance of StorageMetadata that represents the contents of a dictionary.
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, NSObject *> * _Nonnull)dictionary OBJC_DESIGNATED_INITIALIZER;
- (id _Nonnull)copy SWIFT_WARN_UNUSED_RESULT;
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly) NSUInteger hash;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
@end


@class NSData;
@class FIRStorageUploadTask;
@class NSURL;

/// <code>StorageReference</code> represents a reference to a Google Cloud Storage object. Developers can
/// upload and download objects, as well as get/set object metadata, and delete an object at the
/// path. See the Cloud docs  for more details: https://cloud.google.com/storage/
SWIFT_CLASS_NAMED("StorageReference")
@interface FIRStorageReference : NSObject
/// The <code>Storage</code> service object which created this reference.
@property (nonatomic, readonly, strong) FIRStorage * _Nonnull storage;
/// The name of the Google Cloud Storage bucket associated with this reference.
/// For example, in <code>gs://bucket/path/to/object.txt</code>, the bucket would be ‘bucket’.
@property (nonatomic, readonly, copy) NSString * _Nonnull bucket;
/// The full path to this object, not including the Google Cloud Storage bucket.
/// In <code>gs://bucket/path/to/object.txt</code>, the full path would be: <code>path/to/object.txt</code>
@property (nonatomic, readonly, copy) NSString * _Nonnull fullPath;
/// The short name of the object associated with this reference.
/// In <code>gs://bucket/path/to/object.txt</code>, the name of the object would be <code>object.txt</code>.
@property (nonatomic, readonly, copy) NSString * _Nonnull name;
/// Creates a new <code>StorageReference</code> pointing to the root object.
///
/// returns:
/// A new <code>StorageReference</code> pointing to the root object.
- (FIRStorageReference * _Nonnull)root SWIFT_WARN_UNUSED_RESULT;
/// Creates a new <code>StorageReference</code> pointing to the parent of the current reference
/// or <code>nil</code> if this instance references the root location.
/// For example:
/// path = foo/bar/baz   parent = foo/bar
/// path = foo           parent = (root)
/// path = (root)        parent = nil
///
/// returns:
/// A new <code>StorageReference</code> pointing to the parent of the current reference.
- (FIRStorageReference * _Nullable)parent SWIFT_WARN_UNUSED_RESULT;
/// Creates a new <code>StorageReference</code> pointing to a child object of the current reference.
/// path = foo      child = bar    newPath = foo/bar
/// path = foo/bar  child = baz    ntask.impl.snapshotwPath = foo/bar/baz
/// All leading and trailing slashes will be removed, and consecutive slashes will be
/// compressed to single slashes. For example:
/// child = /foo/bar     newPath = foo/bar
/// child = foo/bar/     newPath = foo/bar
/// child = foo///bar    newPath = foo/bar
/// \param path The path to append to the current path. 
///
///
/// returns:
/// A new <code>StorageReference</code> pointing to a child location of the current reference.
- (FIRStorageReference * _Nonnull)child:(NSString * _Nonnull)path SWIFT_WARN_UNUSED_RESULT;
/// Asynchronously uploads data to the currently specified <code>StorageReference</code>,
/// without additional metadata.
/// This is not recommended for large files, and one should instead upload a file from disk.
/// \param uploadData The data to upload.
///
/// \param metadata <code>StorageMetadata</code> containing additional information (MIME type, etc.)
/// about the object being uploaded.
///
///
/// returns:
/// An instance of <code>StorageUploadTask</code>, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putData:(NSData * _Nonnull)uploadData metadata:(FIRStorageMetadata * _Nullable)metadata;
/// Asynchronously uploads data to the currently specified <code>StorageReference</code>.
/// This is not recommended for large files, and one should instead upload a file from disk.
/// \param uploadData The data to upload. 
///
///
/// returns:
/// An instance of <code>StorageUploadTask</code>, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putData:(NSData * _Nonnull)uploadData;
/// Asynchronously uploads data to the currently specified <code>StorageReference</code>.
/// This is not recommended for large files, and one should instead upload a file from disk.
/// \param uploadData The data to upload.
///
/// \param metadata <code>StorageMetadata</code> containing additional information (MIME type, etc.)
/// about the object being uploaded.
///
/// \param completion A closure that either returns the object metadata on success,
/// or an error on failure.
///
///
/// returns:
/// An instance of <code>StorageUploadTask</code>, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putData:(NSData * _Nonnull)uploadData metadata:(FIRStorageMetadata * _Nullable)metadata completion:(void (^ _Nullable)(FIRStorageMetadata * _Nullable, NSError * _Nullable))completion;
/// Asynchronously uploads a file to the currently specified <code>StorageReference</code>.
/// <code>putData</code> should be used instead of <code>putFile</code> in Extensions.
/// \param fileURL A URL representing the system file path of the object to be uploaded.
///
/// \param metadata <code>StorageMetadata</code> containing additional information (MIME type, etc.)
/// about the object being uploaded.
///
///
/// returns:
/// An instance of <code>StorageUploadTask</code>, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putFile:(NSURL * _Nonnull)fileURL metadata:(FIRStorageMetadata * _Nullable)metadata;
/// Asynchronously uploads a file to the currently specified <code>StorageReference</code>,
/// without additional metadata.
/// <code>putData</code> should be used instead of <code>putFile</code> in Extensions.
/// @param fileURL A URL representing the system file path of the object to be uploaded.
/// @return An instance of StorageUploadTask, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putFile:(NSURL * _Nonnull)fileURL;
/// Asynchronously uploads a file to the currently specified <code>StorageReference</code>.
/// <code>putData</code> should be used instead of <code>putFile</code> in Extensions.
/// \param fileURL A URL representing the system file path of the object to be uploaded.
///
/// \param metadata <code>StorageMetadata</code> containing additional information (MIME type, etc.)
/// about the object being uploaded.
///
/// \param completion A completion block that either returns the object metadata on success,
/// or an error on failure.
///
///
/// returns:
/// An instance of <code>StorageUploadTask</code>, which can be used to monitor or manage the upload.
- (FIRStorageUploadTask * _Nonnull)putFile:(NSURL * _Nonnull)fileURL metadata:(FIRStorageMetadata * _Nullable)metadata completion:(void (^ _Nullable)(FIRStorageMetadata * _Nullable, NSError * _Nullable))completion;
/// Asynchronously downloads the object at the <code>StorageReference</code> to a <code>Data</code> instance in memory.
/// A <code>Data</code> buffer of the provided max size will be allocated, so ensure that the device has enough free
/// memory to complete the download. For downloading large files, <code>write(toFile:)</code> may be a better option.
/// \param maxSize The maximum size in bytes to download. If the download exceeds this size,
/// the task will be cancelled and an error will be returned.
///
/// \param completion A completion block that either returns the object data on success,
/// or an error on failure.
///
///
/// returns:
/// An <code>StorageDownloadTask</code> that can be used to monitor or manage the download.
- (FIRStorageDownloadTask * _Nonnull)dataWithMaxSize:(int64_t)maxSize completion:(void (^ _Nonnull)(NSData * _Nullable, NSError * _Nullable))completion;
/// Asynchronously retrieves a long lived download URL with a revokable token.
/// This can be used to share the file with others, but can be revoked by a developer
/// in the Firebase Console.
/// \param completion A completion block that either returns the URL on success, 
/// or an error on failure.
///
- (void)downloadURLWithCompletion:(void (^ _Nonnull)(NSURL * _Nullable, NSError * _Nullable))completion;
/// Asynchronously downloads the object at the current path to a specified system filepath.
/// <ul>
///   <li>
///     Returns An <code>StorageDownloadTask</code> that can be used to monitor or manage the download.
///   </li>
/// </ul>
/// \param fileURL A file system URL representing the path the object should be downloaded to. 
///
- (FIRStorageDownloadTask * _Nonnull)writeToFile:(NSURL * _Nonnull)fileURL;
/// Asynchronously downloads the object at the current path to a specified system filepath.
/// \param fileURL A file system URL representing the path the object should be downloaded to.
///
/// \param completion A closure that fires when the file download completes, passed either
/// a URL pointing to the file path of the downloaded file on success,
/// or an error on failure.
///
///
/// returns:
/// A <code>StorageDownloadTask</code> that can be used to monitor or manage the download.
- (FIRStorageDownloadTask * _Nonnull)writeToFile:(NSURL * _Nonnull)fileURL completion:(void (^ _Nullable)(NSURL * _Nullable, NSError * _Nullable))completion;
/// Lists all items (files) and prefixes (folders) under this <code>StorageReference</code>.
/// This is a helper method for calling <code>list()</code> repeatedly until there are no more results.
/// Consistency of the result is not guaranteed if objects are inserted or removed while this
/// operation is executing. All results are buffered in memory.
/// <code>listAll(completion:)</code> is only available for projects using Firebase Rules Version 2.
/// \param completion A completion handler that will be invoked with all items and prefixes under 
/// the current <code>StorageReference</code>.
///
- (void)listAllWithCompletion:(void (^ _Nonnull)(FIRStorageListResult * _Nullable, NSError * _Nullable))completion;
/// List up to <code>maxResults</code> items (files) and prefixes (folders) under this StorageReference.
/// “/” is treated as a path delimiter. Firebase Storage does not support unsupported object
/// paths that end with “/” or contain two consecutive “/“s. All invalid objects in GCS will be
/// filtered.
/// <code>list(maxResults:completion:)</code> is only available for projects using Firebase Rules Version 2.
/// \param maxResults The maximum number of results to return in a single page. Must be greater
/// than 0 and at most 1000.
///
/// \param completion A completion handler that will be invoked with up to <code>maxResults</code> items and
/// prefixes under the current <code>StorageReference</code>.
///
- (void)listWithMaxResults:(int64_t)maxResults completion:(void (^ _Nonnull)(FIRStorageListResult * _Nullable, NSError * _Nullable))completion;
/// Resumes a previous call to <code>list(maxResults:completion:)</code>, starting after a pagination token.
/// Returns the next set of items (files) and prefixes (folders) under this <code>StorageReference</code>.
/// “/” is treated as a path delimiter. Storage does not support unsupported object
/// paths that end with “/” or contain two consecutive “/“s. All invalid objects in GCS will be
/// filtered.
/// <code>list(maxResults:pageToken:completion:)</code>is only available for projects using Firebase Rules
/// Version 2.
/// \param maxResults The maximum number of results to return in a single page. Must be greater
/// than 0 and at most 1000.
///
/// \param pageToken A page token from a previous call to list.
///
/// \param completion A completion handler that will be invoked with the next items and prefixes
/// under the current StorageReference.
///
- (void)listWithMaxResults:(int64_t)maxResults pageToken:(NSString * _Nonnull)pageToken completion:(void (^ _Nonnull)(FIRStorageListResult * _Nullable, NSError * _Nullable))completion;
/// Retrieves metadata associated with an object at the current path.
/// \param completion A completion block which returns the object metadata on success, 
/// or an error on failure.
///
- (void)metadataWithCompletion:(void (^ _Nonnull)(FIRStorageMetadata * _Nullable, NSError * _Nullable))completion;
/// Updates the metadata associated with an object at the current path.
/// \param metadata A <code>StorageMetadata</code> object with the metadata to update.
///
/// \param completion A completion block which returns the <code>StorageMetadata</code> on success,
/// or an error on failure.
///
- (void)updateMetadata:(FIRStorageMetadata * _Nonnull)metadata completion:(void (^ _Nullable)(FIRStorageMetadata * _Nullable, NSError * _Nullable))completion;
/// Deletes the object at the current path.
/// \param completion A completion block which returns a nonnull error on failure. 
///
- (void)deleteWithCompletion:(void (^ _Nullable)(NSError * _Nullable))completion;
- (id _Nonnull)copy SWIFT_WARN_UNUSED_RESULT;
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly) NSUInteger hash;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end





@class NSProgress;

/// <code>StorageTaskSnapshot</code> represents an immutable view of a task.
/// A snapshot contains a task, storage reference, metadata (if it exists),
/// progress, and an error (if one occurred).
SWIFT_CLASS_NAMED("StorageTaskSnapshot")
@interface FIRStorageTaskSnapshot : NSObject
/// The task this snapshot represents.
@property (nonatomic, readonly, strong) FIRStorageTask * _Nonnull task;
/// Metadata returned by the task, or <code>nil</code> if no metadata returned.
@property (nonatomic, readonly, strong) FIRStorageMetadata * _Nullable metadata;
/// The <code>StorageReference</code> this task operates on.
@property (nonatomic, readonly, strong) FIRStorageReference * _Nonnull reference;
/// An object which tracks the progress of an upload or download.
@property (nonatomic, readonly, strong) NSProgress * _Nullable progress;
/// An error raised during task execution, or <code>nil</code> if no error occurred.
@property (nonatomic, readonly) NSError * _Nullable error;
/// The status of the task.
@property (nonatomic, readonly) enum FIRStorageTaskStatus status;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

typedef SWIFT_ENUM_NAMED(NSInteger, FIRStorageTaskStatus, "StorageTaskStatus", closed) {
  FIRStorageTaskStatusUnknown = 0,
  FIRStorageTaskStatusResume = 1,
  FIRStorageTaskStatusProgress = 2,
  FIRStorageTaskStatusPause = 3,
  FIRStorageTaskStatusSuccess = 4,
  FIRStorageTaskStatusFailure = 5,
};


/// <code>StorageUploadTask</code> implements resumable uploads to a file in Firebase Storage.
/// Uploads can be returned on completion with a completion callback, and can be monitored
/// by attaching observers, or controlled by calling <code>pause()</code>, <code>resume()</code>,
/// or <code>cancel()</code>.
/// Uploads can be initialized from <code>Data</code> in memory, or a URL to a file on disk.
/// Uploads are performed on a background queue, and callbacks are raised on the developer
/// specified <code>callbackQueue</code> in Storage, or the main queue if unspecified.
/// Currently all uploads must be initiated and managed on the main queue.
SWIFT_CLASS_NAMED("StorageUploadTask")
@interface FIRStorageUploadTask : FIRStorageObservableTask <FIRStorageTaskManagement>
/// Prepares a task and begins execution.
- (void)enqueue;
/// Pauses a task currently in progress.
- (void)pause;
/// Cancels a task.
- (void)cancel;
/// Resumes a paused task.
- (void)resume;
@end

#endif
#if defined(__cplusplus)
#endif
#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#else
#error unsupported Swift architecture
#endif
