# Schema Resource : icarGroupMovementDepartureEventResource

This is a resource that represents an an observation of a group of animals leaving the location.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| departureKind | [icarDepartureKindType](../../enums/icarDepartureKindType.json) | Yes | Coded description of the type of departure (e.g. sale, agistment, other). |
| departureReason | [icarDepartureReasonType](../../enums/icarDepartureReasonType.json) | - | Coded description of the reason why the animals are departing. |
| consignment | [icarConsignmentType](../types/icarConsignmentType.md) | - | Provides consignment level information about origin, destination, and transport. |
