# Schema Resource : icarGroupMovementBirthEventResource

This is a resource that represents an an observation of a group of animals being registered at a location.
NOTE: This event has "birth" in its name for compatibility with the individual animal `icarMovementBirthEventResource` which records the registration of a new animal born and tagged on the location. However, it implies tagging and first recording rather than actual birth of animals.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| registrationReason | [icarRegistrationReasonType](../../enums/icarRegistrationReasonType.json) | Yes | Specifies why the animals are being registered. |

