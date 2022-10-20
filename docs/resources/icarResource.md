# Schema Resource : icarResource

All resources that can be independently fetched through a GET method (or equivalent) in the ICAR specifications include the properties of `icarResource`. It is effectively an *abstract base class* (although this is not a concept in JSON Schema).

## Properties

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| resourceType | string | Yes | A **discriminator** property that uniquely identifies the type of resource - for instance `icarWeightEventResource` or `icarAnimalSetResource`. Discriminators are used for deserialisation and serialisation of JSON in some languages, but can also help identify the concrete resource type used in generalised contexts (such as a synchronisation API or a link to a related resource). |
| @self | string - uri | Recommended | Uniform resource identifier (URI) of the resource (rel=self). Compliant with JSON-LD.  |
| meta | [icarMetaDataType](../types/icarMetaDataType.md) | Recommended | Meta data for the resource, including source identity and date/time modified. This is essential for synchronisation of data between systems. |
| location | [icarLocationIdentifierType](../types/icarLocationIdentifierType.md) | Recommended | A scheme and identifier combination that identifies the current location to which the resource relates. |



