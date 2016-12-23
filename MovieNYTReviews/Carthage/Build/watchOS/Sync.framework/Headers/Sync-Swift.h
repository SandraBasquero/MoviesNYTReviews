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
@import ObjectiveC;
@import Foundation;
@import CoreData;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSManagedObjectContext;
@class NSManagedObject;

/**
  Helps you filter insertions, deletions and updates by comparing your JSON dictionary with your Core Data local objects.
  It also provides uniquing for you locally stored objects and automatic removal of not found ones.
*/
SWIFT_CLASS("_TtC4Sync10DATAFilter")
@interface DATAFilter : NSObject
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName localPrimaryKey:(NSString * _Nonnull)localPrimaryKey remotePrimaryKey:(NSString * _Nonnull)remotePrimaryKey context:(NSManagedObjectContext * _Nonnull)context inserted:(SWIFT_NOESCAPE void (^ _Nonnull)(NSDictionary<NSString *, id> * _Nonnull))inserted updated:(SWIFT_NOESCAPE void (^ _Nonnull)(NSDictionary<NSString *, id> * _Nonnull, NSManagedObject * _Nonnull))updated;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSArray (SWIFT_EXTENSION(Sync))
@end

@class NSRelationshipDescription;

@interface NSEntityDescription (SWIFT_EXTENSION(Sync))
/**
  Finds the relationships for the current entity.
  <ul>
    <li>
      returns The list of relationships for the current entity.
    </li>
  </ul>
*/
- (NSArray<NSRelationshipDescription *> * _Nonnull)sync_relationships;
/**
  Finds the parent for the current entity, if there are many parents nil will be returned.
  <ul>
    <li>
      returns The parent relationship for the current entity
    </li>
  </ul>
*/
- (NSRelationshipDescription * _Nullable)sync_parentEntity;
@end


@interface NSManagedObject (SWIFT_EXTENSION(Sync))
/**
  Using objectID to fetch an NSManagedObject from a NSManagedContext is quite unsafe,
  and has unexpected behaviour most of the time, although it has gotten better throught
  the years, it’s a simple method with not many moving parts.
  Copy in context gives you a similar behaviour, just a bit safer.
  \param context The context where the NSManagedObject will be taken


  returns:
  A NSManagedObject copied in the provided context.
*/
- (NSManagedObject * _Nonnull)sync_copyInContext:(NSManagedObjectContext * _Nonnull)context;
/**
  Syncs relationships where only the ids are present, for example if your model is: User <<->> Tags (a user has many tags and a tag belongs to many users),
  and your tag has a users_ids, it will try to sync using those ID instead of requiring you to provide the entire users list inside each tag.
  \param relationship The relationship to be synced.

  \param localPrimaryKey The localPrimaryKey of the relationship to be synced, usually an array of strings or numbers.

*/
- (void)sync_toManyRelationshipUsingIDsInsteadOfDictionary:(NSRelationshipDescription * _Nonnull)relationship localPrimaryKey:(id _Nonnull)localPrimaryKey;
/**
  Syncs relationships where only the id is present, for example if your model is: Company -> Employee,
  and your employee has a company_id, it will try to sync using that ID instead of requiring you to provide the
  entire company object inside the employees dictionary.
  \param relationship The relationship to be synced.

  \param localPrimaryKey The localPrimaryKey of the relationship to be synced, usually a number or an integer.

  \param dataStack The DATAStack instance.

*/
- (void)sync_toOneRelationshipUsingIDInsteadOfDictionary:(NSRelationshipDescription * _Nonnull)relationship localPrimaryKey:(id _Nonnull)localPrimaryKey;
@end

@class NSPredicate;
@class NSManagedObjectID;

@interface NSManagedObjectContext (SWIFT_EXTENSION(Sync))
/**
  Safely fetches a NSManagedObject in the current context. If no localPrimaryKey is provided then it will check for the parent entity and use that. Otherwise it will return nil.
  \param entityName The name of the Core Data entity.

  \param localPrimaryKey The primary key.

  \param parent The parent of the object.

  \param parentRelationshipName The name of the relationship with the parent.


  returns:
  A NSManagedObject contained in the provided context.
*/
- (NSManagedObject * _Nullable)safeObject:(NSString * _Nonnull)entityName localPrimaryKey:(id _Nullable)localPrimaryKey parent:(NSManagedObject * _Nullable)parent parentRelationshipName:(NSString * _Nullable)parentRelationshipName;
- (NSDictionary<id <NSCopying>, NSManagedObjectID *> * _Nonnull)managedObjectIDsIn:(NSString * _Nonnull)entityName usingAsKey:(NSString * _Nonnull)attributeName predicate:(NSPredicate * _Nullable)predicate;
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

@class DATAStack;

SWIFT_CLASS("_TtC4Sync4Sync")
@interface Sync : NSOperation
@property (nonatomic) BOOL downloadFinished;
@property (nonatomic) BOOL downloadExecuting;
@property (nonatomic) BOOL downloadCancelled;
@property (nonatomic, readonly) BOOL isFinished;
@property (nonatomic, readonly) BOOL isExecuting;
@property (nonatomic, readonly) BOOL isCancelled;
@property (nonatomic, readonly) BOOL isAsynchronous;
@property (nonatomic, copy) NSArray<NSDictionary<NSString *, id> *> * _Nonnull changes;
@property (nonatomic, copy) NSString * _Nonnull entityName;
@property (nonatomic, strong) NSPredicate * _Nullable predicate;
@property (nonatomic, strong) NSManagedObject * _Nullable parent;
@property (nonatomic, strong) NSRelationshipDescription * _Nullable parentRelationship;
@property (nonatomic, strong) NSManagedObjectContext * _Nullable context;
@property (nonatomic, assign) DATAStack * _Nonnull dataStack;
- (void)updateExecuting:(BOOL)isExecuting;
- (void)updateFinished:(BOOL)isFinished;
- (void)start;
- (void)performUsing:(NSManagedObjectContext * _Nonnull)context;
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

  \param dataStack The DATAStack instance.

  \param completion The completion block, it returns an error if something in the Sync process goes wrong.

*/
+ (void)changes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)changes inEntityNamed:(NSString * _Nonnull)entityName predicate:(NSPredicate * _Nullable)predicate parent:(NSManagedObject * _Nullable)parent inContext:(NSManagedObjectContext * _Nonnull)context dataStack:(DATAStack * _Nonnull)dataStack completion:(void (^ _Nullable)(NSError * _Nullable))completion;
@end


SWIFT_CLASS("_TtC4Sync9TestCheck")
@interface TestCheck : NSObject
/**
  Method to check wheter your on testing mode or not.

  returns:
  A Bool, \code
  true
  \endcode if you’re on testing mode, \code
  false
  \endcode if you’re not.
*/
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly) BOOL isTesting;)
+ (BOOL)isTesting;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop