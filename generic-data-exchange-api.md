# Generic Data Exchange API

This API specification defines a protocol for how a client can consume data from a server and update a local database or store. A compliant server exposes a number of datasets. Each dataset contains data entities of one or more type. Each dataset exposes a feed of changes. Each change is represented as the latest representation of an entity. Each entity has unique identity across all entities in all datasets exposed by a single server.

## Background

This protocol is based on the UDA API (https://open.mimiro.io/specifications/uda/latest.html) specification and the SDShare (https://www.sdshare.org) protocol. These protocols and variants have been deployed over the last 15 years in both open world projects and internally for enterprise data sharing and integration. They provide robust data sharing mechanisms with a low bar to entry.  

# Protocol Definition

The API has a single entry point and is consistently structured to allow introspection and dynamic navigation.

## Datasets Endpoint

/datasets => 

```json
[
    {
        "name" : "animals",
        "url" : "/datasets/animal",
        "changes" : "/datasets/animals/changes",
        "containsTypes" : [ "http://data.adewg.io/Animal"],
        "count" : 5000,
        "lastModified" : "date time"
    }
    ,
    {

    }
]
```

## Dataset Endpoint

/datasets/{datasetid}

```json
{
    "name" : "animals",
    "url" : "/datasets/animal",
    "changes" : "/datasets/animals/changes",
    "containsTypes" : [ "http://data.adewg.io/Animal"],
    "count" : 5000,
    "lastModified" : "date time"
}
```

## Changes Endpoint

/datasets/{datasetid}/changes?since={sinceToken}

The changes endpoint returns the following JSON response:

```json
[
  {
     context object - application specific / expansion point for rdf, JSON-LD and Entity Graph Data Model 
  },

  {
      resource
  },

  {
      resource
  },

  {
      continuation object
  }
]
```

The continuation object contains a property 'token'. The token is an opaque string encoded with base64. This means the client should NOT try to guess at whats inside. 

If a server has reloaded all data and needs the client to resync from the beginning, then the server can return an HTTP Header:

full-sync: true

If this is returned the client should delete all local data. discard any since tokens and replace it with the resource from a call to /changes.

A client is responsible for storing the continuation token and then using it the next time it asks. Note that the continuation token can be used by the server to provide paging. A client typically calls to the changes endpoint until no entities are returned. It then stores the token and then waits for some period before asking again. 

## Dataset Push 

The datasets concept can also be used in a push based scenario. In this model a client streams a sequence of resources to the dataset's entities endpoint. 

`/dataset/{datasetid}/entities`

See full sync versus incremental in this situation.

# Web Socket Variant

It is also possible to deliver the same service over a websocket. In this model the client connects with a since token and then receives changes over the socket. The socket remains open and the server can then push any further changes to the client as they become available.

# Security

Recommended to use JWT tokens to indicate a client. 

The server is then responsible for mapping that client to a set of claims and then which locations that should provide access to. The set of resources exposed should only be for the locations that a given client can access.