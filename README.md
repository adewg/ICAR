# ICAR ADE JSON draft

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)
This repository contains the ICAR ADE work-in-progress JSON standard.

Approach
========

The approach for coming to this standard is to take input from different sources, 
merge these into a standard and propose that to the working group.

In the DataLinker directory, the work done previously by Rezare et al. can be 
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
  * Create preferred names for url’s, filter parameters, pagination etc
* Endpoints per message
  * Allows specific access to only the data required for the use case 
  * Allows a per-URI mandate
  * Allows a per-vendor decision which URI’s to support
* Start simple, grow into complexity
  * Optimise for 80% of the use cases
  * Combine messages into complex messages or batches only when a use case proofs it is required
  * Allow vendor-specific properties such as pagination and HATEOAS; create an optional recommendation for that
* No embedded messages (deviation from proposed standard)
  * Single endpoint should mean single message 

* Avoid output-parameters that steer what the end-point should produce
  * Standard should not dictate the URL pattern
  * Prefer to use specialized end-points so vendor-specifics are dictated only by which URL’s they support


