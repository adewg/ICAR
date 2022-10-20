# Schema Resource : icarEventCoreResource

This is a resource that represents an event observation that may be recorded on an entity. Extensions to this resource will define the type of entity (for example, an animal, group, or location), and the actual event being observed.


## Properties

Contains all the properties defined in [icarResource](../resources/icarResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| id | string | Yes | Unique identifier in the source system for this event. |
| eventDateTime | [icarDateTimeType](../types/icarDateTimeType.md) | Yes - in concrete classes | RFC3339 UTC date and time (see https://ijmacd.github.io/rfc3339-iso8601/). |
| traitLabel | [icarTraitLabelIdentifierType](../../types/icarTraitLabelIdentifierType.md) | - | If the event represents a formal trait, identifies the recording system (scheme) and trait (id). |
| responsible | string | - | Use if an observation is manually recorded, or an event is carried out or authorised by a person. |
| contemporaryGroup | string | - | For manually recorded events, record any contemporary group code that would affect statistical analysis. |
| remark | string | - | A comment or remark field for additional user-specified information about the event. |





