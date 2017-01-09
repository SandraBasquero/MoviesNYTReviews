// Generated by Apple Swift version 3.0.1 (swiftlang-800.0.58.6 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
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

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
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
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
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
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
@import CoreData;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

@interface NSArray (SWIFT_EXTENSION(Sync))
@end


@interface NSEntityDescription (SWIFT_EXTENSION(Sync))
@end


@interface NSManagedObject (SWIFT_EXTENSION(Sync))
@end


@interface NSManagedObjectContext (SWIFT_EXTENSION(Sync))
@end

@class NSError;

@interface NSPersistentContainer (SWIFT_EXTENSION(Sync))
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
- (void)sync:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName completion:(void (^ _Nullable)(NSError * _Nullable))completion;
/**
  Deletes a managed object for the provided primary key in an specific entity.
  \param id The primary key.

  \param entityName The name of the entity.

  \param error The Core Data error.

*/
- (void)delete:(id _Nonnull)id inEntityNamed:(NSString * _Nonnull)entityName completion:(void (^ _Nonnull)(NSError * _Nullable))completion;
@end


SWIFT_CLASS("_TtC4Sync4Sync")
@interface Sync : NSOperation
@property (nonatomic, readonly) BOOL isFinished;
@property (nonatomic, readonly) BOOL isExecuting;
@property (nonatomic, readonly) BOOL isCancelled;
@property (nonatomic, readonly) BOOL isAsynchronous;
- (void)start;
- (void)cancel;
/**
  Deletes a managed object for the provided primary key in an specific entity.
  \param id The primary key.

  \param entityName The name of the entity.

  \param context The context to be used, make sure that this method gets called in the same thread as the context using \code
  perform
  \endcode or \code
  performAndWait
  \endcode.


  throws:
  Core Data related issues.
*/
+ (BOOL)delete:(id _Nonnull)id inEntityNamed:(NSString * _Nonnull)entityName using:(NSManagedObjectContext * _Nonnull)context error:(NSError * _Nullable * _Nullable)error;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class NSPredicate;

@interface Sync (SWIFT_EXTENSION(Sync))
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param predicate The predicate used to filter out changes, if you want to exclude some local items to be taken in
  account in the Sync process, you just need to provide this predicate.

  \param persistentContainer The NSPersistentContainer instance.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName predicate:(NSPredicate * _Nullable)predicate persistentContainer:(NSPersistentContainer * _Nonnull)persistentContainer completion:(void (^ _Nullable)(NSError * _Nullable))completion;
@end

@class DATAStack;

@interface Sync (SWIFT_EXTENSION(Sync))
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param dataStack The DATAStack instance.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName dataStack:(DATAStack * _Nonnull)dataStack completion:(void (^ _Nullable)(NSError * _Nullable))completion;
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param predicate The predicate used to filter out changes, if you want to exclude some local items to be taken in
  account in the Sync process, you just need to provide this predicate.

  \param dataStack The DATAStack instance.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName predicate:(NSPredicate * _Nullable)predicate dataStack:(DATAStack * _Nonnull)dataStack completion:(void (^ _Nullable)(NSError * _Nullable))completion;
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param parent The parent of the synced items, useful if you are syncing the childs of an object, for example
  an Album has many photos, if this photos don’t incldue the album’s JSON object, syncing the photos JSON requires
  you to send the parent album to do the proper mapping.

  \param dataStack The DATAStack instance.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName parent:(NSManagedObject * _Nonnull)parent dataStack:(DATAStack * _Nonnull)dataStack completion:(void (^ _Nullable)(NSError * _Nullable))completion;
/**
  Syncs the entity using the received array of dictionaries, maps one-to-many, many-to-many and one-to-one relationships.
  It also syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param changes The array of dictionaries used in the sync process.

  \param entityName The name of the entity to be synced.

  \param predicate The predicate used to filter out changes, if you want to exclude some local items to be taken in
  account in the Sync process, you just need to provide this predicate.

  \param parent The parent of the synced items, useful if you are syncing the childs of an object, for example
  an Album has many photos, if this photos don’t incldue the album’s JSON object, syncing the photos JSON requires

  \param context The context where the items will be created, in general this should be a background context.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName predicate:(NSPredicate * _Nullable)predicate parent:(NSManagedObject * _Nullable)parent inContext:(NSManagedObjectContext * _Nonnull)context completion:(void (^ _Nullable)(NSError * _Nullable))completion;
@end

#pragma clang diagnostic pop
