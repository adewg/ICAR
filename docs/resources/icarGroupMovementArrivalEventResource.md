# Schema Resource : icarGroupMovementArrivalEventResource

This is a resource that represents an an observation of a group of animals arriving on farm.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| arrivalReason | [icarArrivalReasonType](../../enums/icarArrivalReasonType.json) | Yes | Specifies why the animals are being brought onto the location. |
| consignment | [icarConsignmentType](../types/icarConsignmentType.md) | - | Provides consignment level information about origin, destination, and movement documents. |
