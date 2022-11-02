# Location based vs Data Exchange API

The ICAR ADE specification primarily deals with message definitions. How to transport those messages is defined separately from those messages. Currently, ADE has two recommended ways of getting an ICAR ADE message: a location based API and a generic data exchange API. Both make use of REST Json.

This document should help you determine which one is most suitable for your needs. 

## Shared base

Both API styles make use of REST Json. The messages they expose are the same ADE messages. The messages themselves are still grouped around a location. The main difference is in how you query for specific content. 

## Location Based API

The [location based API](https://github.com/adewg/ICAR/blob/Develop/docs/location-based-api.md), centers (unsurpringly) around _locations_. It assumes that your use case has a specific stable, parcel or farm for which you want a specific message to be send or received. Each endpoint defined in the API is a single location with a single message type. 

If you need specific data for a specific location, this is the API for you. You know exactly what message you will be getting and that makes it very predictable and stable.


## Generic Data Exchange API
The [generic data exchange API](https://github.com/adewg/ICAR/blob/Develop/docs/generic-data-exchange-api.md) is meant for use cases where you want to synchronise data over multiple locations and many different message types. Instead of knowing up-front which message type and/or location you want to exchange, this API style instead allows you to query any relevant changes (for message types and locations that you are authorised for). So, instead of a single message of a single type for a single location, instead you will get a stream of messages for all locations.

This allows you to produce or consume messages over multiple locations and multiple types, and even query message types that you didn't know up front. This does mean that the responses are more diverse, meaning that you would have to determine the type(s) at run-time. (They are still strongly typed by referencing the definition).
