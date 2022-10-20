# Schema Resource : icarGroupWeightEventResource

This resource represents a live weight observed on a group of animals, for instance an average or sample weighing.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| units | [uncefactMassUnitsType](../../enums/uncefactMassUnitsType.json) | - | Units specified in UN/CEFACT 3-letter form. Default if not specified is KGM. |
| method | [icarWeightMethodType](../../enums/icarWeightMethodType.json) | - | The method of observation. Loadcell is the default if not specified. |
| resolution | number | - | The smallest measurement difference that can be discriminated given the current device settings. Specified in Units, for instance 0.5 (kilograms). |
| animalWeights | array of [icarIndividualWeightType](../types/icarIndividualWeightType.md) | - | Array of animal id and weight pairs for animals in the event. |
| statistics | array of [icarStatisticsType](../types/icarStatisticsType.md) | - | Array of weight statistics, namely average, sum, min, max, count, stdev. |
| device | [icarDeviceReferenceType](../types/icarDeviceReferenceType.md) | - | Optional information about the device used for the measurement. |
| timeOffFeed | number | - | Hours of curfew or withholding feed prior to weighing to standardise gut fill. |

