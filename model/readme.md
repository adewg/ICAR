# Information Model for Dairy Data Model - Dairy Information Model

The json schema and API define the exchange syntax for the Dairy Data Model. While this structures allude to the underlying data model they do not fully describe or explain it fully. Examples of this are properties that are the Ids of other constructs, references between events and animals, or for example lineage relationships.

This document describes the logical data model that underpins the JSON serialisations. Its goal is to communicate less ambiguously the relationships and structures of the model.

The model is defined here using Semantic Technologies to formalise the diiferent constructs, their properties and relationships. 

A formal model as defined here can further be used to generate visual diagrams and also as the basis for defining how API operations are expected to work. E.g. defining an initial state of a 'location', then an operation, and then the expected new state. 

# Example

The following example shows how basic constructs are represented with RDF and SHACL.

We take a core construct such as Animal

``` json

{
  "description": "Core schema for representing animal",

  "allOf": [{
      "$ref": "../resources/icarResource.json"
    },
    {
      "type": "object",

      "required": [
        "identifier",
        "specie",
        "gender"
      ],
      
      "properties": {
        "identifier": {
          "$ref": "../types/icarAnimalIdentifierType.json",
          "description": "Unique animal scheme and identifier combination."
        },
        "alternativeIdentifiers": {
          "type": "array",
          "items": {
            "$ref": "../types/icarAnimalIdentifierType.json"
          },
          "description": "Alternative identifiers for the animal. Here, also temporary identifiers, e.g. transponders or animal numbers, can be listed."
        },
        "specie": {
          "$ref": "../enums/icarAnimalSpecieType.json",
          "description": "Species of the animal."
        },
        "gender": {
          "$ref": "../enums/icarAnimalGenderType.json",
          "description": "Gender of the animal."
        },
        "birthDate": {
          "$ref": "../types/icarDateTimeType.json",
          "description": "RFC3339 UTC date/time of birth (see https://ijmacd.github.io/rfc3339-iso8601/ for how to use)."
        },
        "primaryBreed": {
          "$ref": "../types/icarBreedIdentifierType.json",
          "description": "ICAR Breed code for the animal."
        },
        "breedFractions": {
          "$ref": "../types/icarBreedFractionsType.json",
          "description": "Breed fractions for the animal."
        },
        "coatColor": {
          "type": "string",
          "description": "Colour of the animal's coat, using the conventions for that breed."
        },
        "coatColorIdentifier": {
          "$ref": "../types/icarCoatColorIdentifierType.json",
          "description": "Colour of the animal's coat using a national or breed-defined scheme and identifier combination."
        },
        "managementTag": {
          "type": "string",
          "description": "The identifier used by the farmer in day to day operations. In many cases this could be the animal number."
        },
        "name": {
          "type": "string",
          "description": "Name given by the farmer for this animal."
        },
        "officialName": {
          "type": "string",
          "description": "Official herdbook name."
        },
        "productionPurpose": {
          "$ref": "../enums/icarProductionPurposeType.json",
          "description": "Primary production purpose for which animals are bred."
        },
        "status": {
          "$ref": "../enums/icarAnimalStatusType.json",
          "description": "On-farm status of the animal (such as alive, dead, off-farm)."
        },
        "reproductionStatus": {
          "$ref": "../enums/icarAnimalReproductionStatusType.json",
          "description": "Reproduction status of the animal."
        },
        "lactationStatus": {
          "$ref": "../enums/icarAnimalLactationStatusType.json",
          "description": "Lactation status of the animal."
        },
        "parentage": {
          "type": "array",
          "items": {
            "$ref": "../types/icarParentageType.json",
            "description": "Array of parents."
          }
        },
        "healthStatus": {
          "$ref": "../enums/icarAnimalHealthStatusType.json",
          "description": "Health status of the animal (such as Healthy, Suspicious, Ill, InTreatment, ToBeCulled)."
        }
      }
    }
  ]
}
```

And systematically we can create the RDF version of this:

``` turtle

@prefix icar: <http://icar.org/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .

# Animal Class
icar:Animal
  a rdfs:Class ;
  rdfs:label "Core schema for representing animal" .


# Identifiers would not be done like this, but instead as URLs
icar:hasIdentifier
  a rdf:Property ;
  rdfs:label "identifier" ;
  rdfs:range icar:AnimalIdentifierType .

icar:hasAlternativeIdentifiers
  a rdf:Property ;
  rdfs:label "alternativeIdentifiers" ;
  rdfs:range icar:AnimalIdentifierType .

# Properties
icar:hasSpecie
  a rdf:Property ;
  rdfs:label "specie" ;
  rdfs:range icar:AnimalSpecie .

icar:hasSpecie
  a rdf:Property ;
  rdfs:label "specie" ;
  rdfs:range icar:AnimalSpecie .

# Note we remove the form Type from the class names.
icar:hasGender
  a rdf:Property ;
  rdfs:label "gender" ;
  rdfs:range icar:AnimalGenderType .

icar:hasBirthDate
  a rdf:Property ;
  rdfs:label "birthDate" ;
  rdfs:range icar:DateTime .

# This could become just a URI
icar:hasPrimaryBreed
  a rdf:Property ;
  rdfs:label "primaryBreed" ;
  rdfs:range icar:BreedIdentifier .

icar:hasBreedFractions
  a rdf:Property ;
  rdfs:label "breedFractions" ;
  rdfs:range icar:BreedFractions .

icar:hasCoatColor
  a rdf:Property ;
  rdfs:label "coatColor" ;
  rdfs:range xsd:string .

icar:hasCoatColorIdentifier
  a rdf:Property ;
  rdfs:label "coatColorIdentifier" ;
  rdfs:range icar:CoatColorIdentifier .

icar:hasManagementTag
  a rdf:Property ;
  rdfs:label "managementTag" ;
  rdfs:range xsd:string .

icar:hasName
  a rdf:Property ;
  rdfs:label "name" ;
  rdfs:range xsd:string .

icar:hasOfficialName
  a rdf:Property ;
  rdfs:label "officialName" ;
  rdfs:range xsd:string .

icar:hasProductionPurpose
  a rdf:Property ;
  rdfs:label "productionPurpose" ;
  rdfs:range icar:ProductionPurpose .

icar:hasStatus
  a rdf:Property ;
  rdfs:label "status" ;
  rdfs:range icar:AnimalStatus .

icar:hasReproductionStatus
  a rdf:Property ;
  rdfs:label "reproductionStatus" ;
  rdfs:range icar:AnimalReproductionStatus .

icar:hasLactationStatus
  a rdf:Property ;
  rdfs:label "lactationStatus" ;
  rdfs:range icar:AnimalLactationStatus .

icar:hasParentage
  a rdf:Property ;
  rdfs:label "parentage" ;
  rdfs:range icar:Parentage .

icar:hasHealthStatus
  a rdf:Property ;
  rdfs:label "healthStatus" ;
  rdfs:range icar:AnimalHealthStatus .

```

As well as these basic declarations we can also add constraints. It is these constraints that add further rigour to the model.

```
@prefix icar: <http://icar.org/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sh: <http://www.w3.org/ns/shacl#> .

# Define the Animal class as a SHACL shape
icar:AnimalShape
  a sh:NodeShape ;
  sh:targetClass icar:Animal ;
  sh:label "Animal Shape" ;
  sh:description "Constraints for representing an animal." ;
  sh:property [
    sh:path icar:hasIdentifier ;
    sh:name "identifier" ;
    sh:datatype xsd:anyURI ;
    sh:minCount 1 ;
    sh:description "Unique animal scheme and identifier combination." .
  ];
  sh:property [
    sh:path icar:hasAlternativeIdentifiers ;
    sh:name "alternativeIdentifiers" ;
    sh:datatype xsd:anyURI ;
    sh:minCount 0 ;
    sh:description "Alternative identifiers for the animal." .
  ];
  sh:property [
    sh:path icar:hasHealthStatus ;
    sh:name "healthStatus" ;
    sh:datatype xsd:string ;
    sh:minCount 1 ;
    sh:description "Health status of the animal." .
  ] .


```

With the model defined formally like this it is possible to reason about the model and also to define one or more syntactic mappings to the model. So for example it would be possible to represent instance data in RDF and correcly be able to map it to and from the JSON representation.

