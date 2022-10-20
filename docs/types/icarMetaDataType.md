# Schema Type: icarMetaDataType

This type provides generalised resource-level metadata that can be used to support change detection and data synchronisation.


## Properties

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| source | string | Yes | Source where data is retrieved from. URI  or reverse DNS that identifies the source system. |
| sourceId | string | Recommended | A unique identifier (SHOULD be a UUID) for the resource in the original `source` system. Together the `source` and `sourceId` comprise a unique identifier for the resource. |
| isDeleted | boolean | - | Boolean value indicating if this resource has been deleted in the source system. Used to support synchronisation methods. |
| modified | [icarDateTimeType](../types/icarDateTimeType.md) | Yes | RFC3339 UTC date/time of last modification (see https://ijmacd.github.io/rfc3339-iso8601/ for format guidance). |
| created | [icarDateTimeType](../types/icarDateTimeType.md) | - | RFC3339 UTC date/time of initial creation (see https://ijmacd.github.io/rfc3339-iso8601/ for format guidance). May be null. |
| creator | string | - | The person or organisation responsible for creating (first recording) this resource. |
| validFrom | [icarDateTimeType](../types/icarDateTimeType.md) | - | RFC3339 UTC start of period when the resource is valid (see https://ijmacd.github.io/rfc3339-iso8601/ for format guidance). May be null. |
| validTo | [icarDateTimeType](../types/icarDateTimeType.md) | - | RFC3339 UTC end of period when the resource is valid (see https://ijmacd.github.io/rfc3339-iso8601/ for format guidance). May be null. |
