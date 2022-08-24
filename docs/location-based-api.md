# Location Based API

This API specification defines a protocol for how a client can consume specific messages for a specific location from a server and update a local database or store; or push data to a remote endpoint and modify a specific resource for a specific location.

A compliant server exposes an endpoint for location and data type that it supports. See [the basic example Url Scheme](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adewg/ICAR/ADE-1/url-schemes/exampleUrlScheme.json) for how this typically would look like.

## Motivation

The Json message definitions as defined by the ADE workgroup form the basis of the standard. The Location Based API forms the most basic way in how these messages can be exposed. Since each message is grouped per location, the location is the minimal unit for which data can be delivered. 

## Concepts

### Location
A location is roughly defined as a geographical place where data can originate from; this is typically a farm, stable or parcel. It should have a unique identifier in some way. The location's identifier is defined via a _scheme_ and a _value_ in that scheme. This allows multiple schemes to co-exist as we need to support multiple countries and industries which may define their own way to denote a location. 


### End point scope
The scope of each endpoint is one location, one message type. Typically, multiple messages of the same type may exist for a location. For example, multiple _milking visits_ may happen in a stable. The response of an endpoint will thus typically be a list of messages. By default, this list can be filtered by date, using query parameters `meta-modified-from` and `meta-modified-to`. Other filter parameters may be defined as well by the server. See [Filtering resources](https://github.com/adewg/ICAR/wiki/Filtering-resources) for more detail. 

### Message wrapper

As mentioned before, the primary payload of an endpoint is a list of messages. Conforming to the JSON-LD standard, the list is enclosed in a `member` field. On the same level, a `view` field is defined that manages any paging that may happen: if the queried list is too large, a server may decide to break down the response in "pages" and the `view` field provides the client information on how much more there is and how to continue.

The basic response thus looks like this: 
```
{
  "view": {
    "totalItems": 1,
    "totalPages": 1,
    "pageSize": 10,
    "currentPage": 1
  },
  "member": [
    MESSAGE, MESSAGE, MESSAGE, ...
  ]
}
```

In case of an error, an appropriate HTTP Status code will be send back, along with an `errors` message detailing the error.

```
{
  "errors": [
    {
      "id": "string",
      "status": 0,
      "code": "string",
      "title": "string",
      "detail": "string",
      "meta": {}
    }
  ]
}
```
As you can see, the errors are a list of things that went wrong. Each individual error has its own object. The fields per error object are defined as follows
* `id`: a unique event id that could be used to trace this error in log files
* `status`: the http status code for this specific error
* `code`: an server specific code that can be used for automatic matching
* `title`: a short, human-readable summary of the problem
* `detail`: a human-readable explanation with more details


## Protocol
The uri of an endpoint contains the location (in the form of `/locations/{location-scheme}/{location-value}`), followed by the message type.

See [the basic example Url Scheme](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adewg/ICAR/ADE-1/url-schemes/exampleUrlScheme.json).


# Security

All communication SHOULD be over HTTPs. It is RECOMMENDED to use JWT tokens to secure API endpoints.

The server is responsible for mapping a client to a set of claims which give access to certain locations. Typically, claims are expected to be defined as allowed message types per location, allowing the checks to be made fully on the URI itself without having to introspect the body.


