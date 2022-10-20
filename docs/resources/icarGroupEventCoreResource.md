# Schema Resource : icarGroupEventCoreResource

This is a resource that represents an event observation that may be recorded on a group of animals. Extensions to this resource will define actual event being observed.

## Properties

Contains all the properties defined in [icarEventCoreResource](../resources/icarEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| groupMethod | [icarGroupEventMethodType](../../enums/icarGroupEventMethodType.md) | Yes | Indicates whether the event references an existing animal set, has an embedded animal set, or an inventory classification. |
| countObserved | integer | - | Summarises the number of animals observed in the event. Generally the number of animals in the group, but sometimes a sample. |
| inventoryClassification | [icarInventoryClassificationType](../../types/icarInventoryClassificationType.md) | - | Describe the group of animals by their characteristics rather than animal identifiers. |
| embeddedAnimalSet | [icarAnimalSetResource](../resources/icarAnimalSetResource.md) | - | Specifies the set of animals as a list of member animal identifiers. |
| animalSetReference | [icarAnimalSetReferenceType](../types/icarAnimalSetReferenceType.md)] | - | Reference an existing animal set by ID and optionally URI. Suitable for long-lived animal sets that have a mechanism to manage changes to membership. |


