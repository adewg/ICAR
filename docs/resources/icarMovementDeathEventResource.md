# Schema Resource : icarGroupMovementDeathEventResource

This is a resource that represents an an observation of a group of animals that have died or been euthanised.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| deathReason | [icarDeathReasonType](../../enums/icarDeathReasonType.json) | - | Coded reason for death - this is the CAUSE, compared to the MEANS. |
| explanation | string | - | Free text explanation of the reason for death. |
| disposalMethod | [icarDeathDisposalMethodType](../../enums/icarDeathDisposalMethodType.json) | - | Coded disposal methods including approved service, consumption by humans or animals, etc. |
| disposalOperator | string | - | Disposal operator official name (should really be schema.org/organization). |
| disposalReference | string | - | Reference (receipt, docket, or ID) for disposal. |
| consignment | [icarConsignmentType](../types/icarConsignmentType.md) | - | Where disposal is by transport, a consignment record may be required. |
| deathMethod | [icarDeathMethodType](../../enums/icarDeathMethodType.json) | Yes | Defines the MEANS of death, including an accident, natural causes, or euthanised. |




