# ICAR ADE JSON draft
This repository contains the ICAR ADE work-in-progress JSON standard.

This page describes the principles driving this standard. If you want to use the ICAR ADE standard in your application, there are tips and 
tricks in the [Using the standard](https://github.com/adewg/ICAR/blob/master/Using%20the%20standard.md) file. For a quick start, open the 
[exampleUrlScheme.yaml](https://raw.githubusercontent.com/adewg/ICAR/master/Release%20Candidate%20Messages/exampleUrlScheme.yaml) file in 
your favorite OpenAPI Specification editor, or use the following URL to have a preview in the free Redoc tool: [view 
exampleUrlScheme.yaml](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/adewg/ICAR/master/Release%20Candidate%20Messages/exampleUrlScheme.yaml)


Approach
========

The approach for coming to this standard is to take input from different sources, 
merge these into a standard and propose that to the working group.

In the DataLinker directory, the work done previously by Rezare and other organisations can be 
found. In the JoinData directory, the messages as used and/or proposed in the
JoinData/CRV/Lely project can be found. Both are largely based on the existing 
ICAR ADE XML standard and as such overlap largely.

In the Release Candidate Message directory the proposed candidate messages can be found.

Principles
==========
In the discussions within the working group, a number of design principles came up. These principles drive the design and will provide future direction in evolving the standard further.

The principles used are as follows:
* Primarily focus on the body (message)
  * URL with filter/query parameters are outside of the standard
  * But we could propose a ‘default’ or ‘recommendation’ to allow better discoverability
  * Create preferred names for url’s
  * Specification for filter parameters and pagination is within scope
* Endpoints per message (resource or resource list)
  * Allows specific access to only the data required for the use case 
  * Allows a per-URI mandate
  * Allows a per-vendor decision which URI’s to support
* Start simple, grow into complexity
  * Optimise for 80% of the use cases
  * Combine messages into complex messages or batches only when a use case proofs it is required
  * Allow vendor-specific properties such as pagination and HATEOAS; create an optional recommendation for that
* No embedded messages 
  * Single endpoint should mean single message 
  * Embedding should be used for genuinely nested structures (for instance, common metadata, ID formats)
  * Linking process needs to be explicit (JSON-LD or HATEOAS to be confirmed)
* Avoid output-parameters that steer what the end-point should produce
  * Standard should not dictate the URL pattern
  * Prefer to use specialized end-points so vendor-specifics are dictated only by which URL’s they support

Evolving the standard
=====================

* When consuming the data, use a tolerant-reader pattern. If there are any fields in the message that you do not recognise, simply ignore them. This allows the standard to add new fields while maintaining backwards 
compatibility.
* TBD: When a vendor wants to add a new feature not yet in the standard, he can do so. He should then aim to get that field added to the standard. When approved, there is no need to change the message since it is already in the correct form.

Determining the scope of a message
==================================

It is not always easy to determine which data belong to a message and which data should be moved to a dedicated message. Typically you have a message A with some fields a and b that are closely related. The question 
then is if the fields b should get their own message B. The main discussion points are:

* Granularity of permission: does it make sense to allow some fields a to be shared with a party and fields b not? If so, make them separate messages. 
* Isolated usage: is there a use case where the fields b are useable by themselves without a? If so, make them separate messages. Be considerate of chattiness: too fragmented messages lead to a chatty conversation without any use.
* Vendor support: is this a specific feature that can be supported or not by a vendor. The preference is to have availability of endpoints as an indication of availability of features. However, if this is simply a more detailed extension to a message, it may be simply modeled as some optional field(s).

If in doubt, consider making it a dedicated message B first. This allows for an easier upgrade path than combining them first and then splitting them up. An application developer can always keep using the additional 
endpoint for B and switch to the embedded fields b in the message A later. The new fields b in message A are not a problem due to the tolerant reader pattern.

On using abstract base types
============================

Many events (by example) share similar fields such as an id or timestamp. From a maintenance point of view, it is convenient to extract them to a base type from which concrete events can be derived. In JSON Schema 
however, there is no convenient support for this. The closest way of doing it is to have an embedded type. This leads to having the nesting feel a bit awkward if some of these common fields are related to others. 
E.g., in a milking visit we would have the timestamp of the visit in the base type structure, while the duration is part of the concrete data type. As such, the working group decided to not use base types for this 
in the technical definition; however we do specify it 'on paper' so that we keep it consistent and predictable. We anticipate that if these base types become available, we can change the maintenance of the standard 
without impacting the message definitions themselves.

We do consider the existence of meta-data as a separate type. 

TODO: define the fields that should be in the base type event.

TODO: define the meta-data type.
