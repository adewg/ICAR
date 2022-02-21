# Generic Data Exchange API

This API specification defines a protocol for how a client can consume data from a server and update a local database or store. A compliant server exposes a number of datasets. Each dataset contains data entities of one or more type. Each dataset exposes a feed of changes. Each change is represented as the latest representation of an entity that has been craeted, modified or deleted. Each entity has unique identity across all entities in all datasets exposed by a single server.

## Background

This protocol is based on the UDA API (https://open.mimiro.io/specifications/uda/latest.html) specification and the SDShare (https://www.sdshare.org) protocol. These protocols and variants have been deployed both open world projects and internally for enterprise data sharing and integration. They provide robust data sharing mechanisms with a low bar to entry. The ideas in these works have been shaped to work with the ICAR resource types defined.  

## Concepts

# Protocol Definition

The HTTP(s) API has a single entry point and is consistently structured to allow introspection and dynamic navigation. A compliant server exposes the following endpoints.

## Datasets Endpoint

The datasets endpoint returns a list of datasets that it is exposing to the current client. 

`/datasets` 

The following Schema is used to represent a single dataset in the list:

```json
{
    "description": "Dataset Resource.",
    
    "type": "object",
    
    "required": [
        "name", "url", "changes"
    ],

    "properties": {
        "name": {
            "type": "string",
            "description": "Unique dataset name exposes by this service endpoint."
        },
        "url": {
            "type": "string",
            "description": "Dataset url"
        },
        "changes": {
            "type": "string",
            "description": "Url that exposes the changes for this dataset"
        },
        "containedTypes": {
            "type": "array",
            "description": "An array of strings. Each value is the url or shortname of the resource types exposed by this dataset.",
            "items" : {
                "type" : "string"
            }
        }
    }
}
```

An example response from a compliant endpoint could look like the following:

```json
[
    {
        "name" : "animals",
        "url" : "/datasets/animals",
        "changes" : "/datasets/animals/changes",
        "containedTypes" : [ "http://data.adewg.io/Animal"]
    },
    {
        "name" : "everything",
        "url" : "/datasets/everything",
        "changes" : "/datasets/everything/changes"
    }
]
```

## Dataset Endpoint

The datasets endpoint allows a client to retrieve a single dataset. 

`/datasets/{datasetid}`

The schema of the dataset resource is the same as the dataset resource when returned in the list above.

```json
{
    "name" : "animals",
    "url" : "/datasets/animal",
    "changes" : "/datasets/animals/changes",
    "containsTypes" : [ "http://data.adewg.io/Animal"]
}
```

## Changes Endpoint

The changes endpoint named in the dataset resource exposes a changes feed of entities. The response from this request is an array of JSON objects. The first object is a context that is reserved for future use. The last object is a continuation object that allows clients to consume subsequent changes. 

`/datasets/{datasetid}/changes?since={sinceToken}`

The changes endpoint returns the following JSON response:

```json
[
  {
     "id" : "@context object",
     "description" : "application specific / expansion point for rdf, JSON-LD and Entity Graph Data Model" 
  },

  {
      "resourceType" : "Animal",
      "location" : {
          "id" : "a-location-id",
          "scheme" : "io.mimiro.data.no.locations"
      },
      "meta" : {
          "source" : "io.mimiro.data.no.cattle",
          "sourceId" : "some-cow-id-1"
      }
  },

  {
      "resourceType" : "Animal",
      "location" : {
          "id" : "a-location-id",
          "scheme" : "io.mimiro.data.no.locations"
      },
      "meta" : {
          "source" : "io.mimiro.data.no.cattle",
          "sourceId" : "some-cow-id-2",
          "isDeleted" : true
      }
  },

  {
      "id" : "@continuation",
      "token" : "token-issued-by-server-to-get-more-data"
  }
]
```

The first object in the response is for future use and will contain context information. 

The main set of objects in the response are ICAR resources. To be valid in the context of this protocol several properties are required:

`location` : Must be specified as this is the main logical grouping of resources when being exchanged.

`meta/sourceId` : The source id of the meta structure must be present and as stated, it must be a unique id related to the source server. e.g. Values of this must be unique across all resources.

`meta/source` : The source of the meta structure must be present.

`resourceType` : The value of this property must be one of those defined in `resourceTypeCatalog`. It can be either the full URI or the equivalent short name. It MUST be used by clients to correctly identify which type of ICAR resource is being exchanged.

When a client receives the ICAR resources it must process them in order. For each entity it MUST do the following: 

1. check if the `meta/isDeleted` flag is set. If so the local resource with the corresponding sourceId MUST be deleted or marked as deleted depending on the local system semantics.

2. If there is no local version of the resource it MUST be created and the sourceId must be associated with the local object in some way. 

3. If there is a local object with the correlating sourceId then this representation must be deleted and replaced with the one received. Implementations are free to perform deltas, but the result must be the same. 


The last object in the array is a continuation object and contains a property `token`. The token is an opaque string encoded with base64. This token is issued by the server and clients should NOT manipulate the contents. Manipulating the contents of a continuation token gives undefined behaviour when used as part of a subsequent request. 

A client is responsible for storing the continuation token and then using it as the since token in susequent calls. e.g.

`/datasets/{datasetid}/changes?since=token-issued-by-server-to-get-more-data`

Note that the continuation token can be used by the server to provide paging. A client typically calls to the changes endpoint until no entities are returned. It then stores the token and then waits for some period before asking again. 

If a server has reloaded all data in a dataset and needs the client to resync from the beginning, then the server can return an HTTP Header:

`icar-full-sync: true`

If this is returned the client should delete all local data related to this dataset, discard any continuation tokens, then make a call to `/changes` and continue as above.

## Dataset Push 

The datasets concept can also be used in a push based scenario. In this model a client streams a sequence of resources to the dataset's entities endpoint. 

`/dataset/{datasetid}/entities`

# Security

All communication SHOULD be over HTTPs.

It is Recommended to use JWT tokens to secure API endpoints. 

The server is responsible for mapping a client to a set of claims which give access to certain locations. The set of resources exposed MUST only be for the locations that a given client can access. 