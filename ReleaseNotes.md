# Important changes from ADE v1.2.x

There are some important changes that particularly affect OpenAPI code generation between ADE 1.2.x and ADE 1.3.x and later.
If you have implemented ADE 1.2.x or earlier, and particularly if you have used OpenAPI code generation in languages such as C# and Java, you should be aware of these changes.

## Standard Discriminator for resources is now `ResourceType`

The OpenAPI specification allows you to specify a "discriminator" which is used to support de-serialisation of objects from JSON text to native in-memory objects. ADE 1.2.x did not implement this consistently, primarily due to limitations in version 5.x of the common [openapi-generator tool](https://openapi-generator.tech/). 

You can use a discriminator to differentiate, and help to de-serialise JSON into the correct concrete classes (a concept in object-oriented languages like C# and Java). For instance, if you read from a data source that may contain `icarResource` objects, you want to know whether the actual object being read should be instantiated as an `icarTreatmentEventResource`. 

The OpenAPI rules for discriminators are:
* The same discriminator must be used in the base class and derived classes
* The discriminator must be declared as a string property
* The discriminator is required

We had discriminators in ADE 1.2.x, but these were not declared as string properties (only as a discriminator) and we used different discriminators for Resources (`resourceType`) and Events (`eventType`). However, events are also resources.

Version 5.x of openapi-generator does not work properly if the discriminator is defined as a property and required. This does not match the OpenAPI specification.

We identified this when specifying the [generic data exchange API](https://github.com/adewg/ICAR/blob/ADE-1/docs/generic-data-exchange-api.md) where being able to de-serialise objects correctly is essential. We found that some other code generators also did not correctly generate code with our previous specification of discriminators.

## Corrections made in ADE 1.3.1 and ADE 1.3.2 patch releases
* `icarWithdrawalEventResource` inherited from the incorrect event type (#347)
* `icarStatisticsResource` had separate arrays for groups and statistics. The statistics were intended to be nested inside the groups (#353)
* In `icarConsignmentType` `originAddress` and `destinationAddress` were originally strings, and in ADE 1.3 these were extended with `"anyOf"` to also support a schema.org `PostalAddress`. However, this broke Java implementations. We have reverted these to strings, marked them as deprecated for future releases, and added `originPostalAddress` and `destinationPostalAddress` for structured addresses. If you have started implementing 1.3, you should regenerate and check your code for 1.3.2.

## Changes made in ADE 1.3.x:
* The discriminator `resourceType` is defined as a string property in `icarResource.json`. It is therefore included in all resources, including events, using "allOf".
* `resourceType` is a required field as is required by the OpenAPI specification.
* `eventType` has been removed from events as it will not function properly as a discriminator.
* `identifierType` has been removed from `icarIdentifierType.json`. Identifiers are always embedded in known contexts in JSON objects - there is never a need to make a decision when de-serialising these. Further, the only reason why identifiers are subclassed is to assist implementers to understand, find, or define the correct schemes in the [well-known identifier schemes](https://github.com/adewg/ICAR/blob/ADE-1/well-known/identifier-types.md).

## Changes to your implementations from ADE 1.2.x
* Regenerate your code using **openapi-generator 6.x** or later
* Don't use `eventType` or `identifierType` in your implementations
* **Let your data interchange partners know.** Most implementations prior to 1.3.x won't actually need to use the discriminator because the API context defines the type of data to be de-serialised. However, having `resourceType` as a required field may cause problems. We note that as a discriminator in the base class, it was technically always required by the OpenAPI spec, but this may not have been noted and implemented.
* This is also a reminder to continue using the [tolerant reader pattern](https://github.com/adewg/ICAR/wiki/Design-Principles#user-content-fault-tolerance-and-extensibility) described in the ADE design principles, which helps insulate from many of these changes.
