# Schema Resource : icarAnimalSetResource

This is a resource that represents groups or sets of known individual animals.
These sets of animals may be short lived (for instance, a "Session" of animals handled together on the same day and activity), or long lived (for instance, animals grouped for lactation management, health, or reporting and comparisons).

The `icarAnimalSetResource` itself defines its current membership, but the individual animal events [icarAnimalSetJoinEventResource](../resources/icarAnimalSetJoinEventResource.md) and [icarAnimalSetLeaveEventResource](../resources/icarAnimalSetLeaveEventResource.md) represent the addition and removal of animals in the set, and may reflect a changing membership over time. 

Management of animal sets and their representation over time is implementation dependent and not specified by this data exchange specification.

## Properties

Contains all the properties defined in [icarResource](../resources/icarResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| id | string | Yes | Unique identifier in the source system for this animal set. |
| name | string | - | Human readable name of the set. |
| purpose | [icarSetPurposeType](../../enums/icarSetPurposeType.json) | - | The purpose of the animal set. |
| member | array of [icarAnimalIdentifierType](../types/icarAnimalIdentifierType.md) | Yes | Zero or more animal identifiers for the animals currently in the set. |




