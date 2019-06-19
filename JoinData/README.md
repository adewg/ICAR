# JoinData message spec


This directory contains the JoinData specs, derived from the ICAR ADE XML standard.

The Open API Spec file contains the URL scheme for JoinData. It follows a specific structure that ultimately uses the ICAR ADE JSON messages.

URL scheme vs message types
---------------------------
Each _message_ or _event_ has its own path. Per _path_, the (standardized) parameters are described. There is always a default type for errors (called error). The actual response is build up out of several types:
* The full response for a message xxx is described in a type called xxxResponse. This contains an array of data sources that have responded
* The xxxDataSources type describes the response per data source. It can contain information on the data source itself or errors it produced. There are all generic. It can also contain the actual message.
* The xxxResponseDataSource type describes the actual response. This should be a wrapper to an ICAR defined JSON scheme, e.g. to an xxxResource file.


Naming Conventions
------------------

A message that can be transported by itself should be placed in a file called xxxResource. Basic types that are reused in multiple messages and are not transported by themselves should be placed in a file called xxxType. An enum type should be located in a file called xxxCode.

Typically, most messages have a plural version (e.g. icarGestationsResource) which is simply an array wrapping a singular type (e.g. icarGestationResource). In many cases, the endpoint would be defined on the plural version but this allows for more flexibility.

