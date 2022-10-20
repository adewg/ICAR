# Schema Type: icarInventoryClassificationType

This type is used to very flexibly define a group of animals within a location. At the very least the group of animals will have a name and species, but the group may have other defining attributes that allows software systems to interpret the data.

`icarInventoryClassificationType` is most commonly used in group event observations, and is a member of `icarGroupEventCoreResource`.

## Properties

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| name | string | Yes | Human-readable name for this inventory grouping. |
| species | [icarAnimalSpecieType](../../enums/icarAnimalSpecieType.json) | Yes | The species of animals. |
| count | number | - | The count or number of animals in this inventory classification. Where the inventory classification is referenced or defined in an event, the number of animals involved in the event may be smaller than this `count` of the animals in the inventory classification (for instance, if only a sample are involved in the event). |
| sex | [icarAnimalGenderType](../../enums/icarAnimalGenderType.json) | - | The sex of animals in this classification. |
| primaryBreed | [icarBreedIdentifierType](../types/icarBreedIdentifierType.md) | - | Primary breed defined using an identifier and scheme. |
| birthPeriod | string | - | The range of birth dates. Use YYYY (all one year), YYYY-MM (one month), or two RFC3339 dates separated by / to represent a range (e.g., YYYY-MM-DD/YYYY-MM-DD). This field may be null. |
| reproductiveStatus | [icarAnimalReproductionStatusType](../../enums/icarAnimalReproductionStatusType.json) | - | The reproductive/pregnancy status of animals (if all animals in the inventory classification have the same status). |
| lactationStatus | [icarAnimalLactationStatusType](../../enums/icarAnimalLactationStatusType.json) | - | The lactation status of animals (if all the animals in the inventory classification have the same status). |
| productionPurposes | array of [icarProductionPurposeType](../../enums/icarProductionPurposeType.json) | - | A list of production purposes shared by the animals in the inventory classification (see the enumeration values). |

## Examples

1. A group with just a name and species:
```
{ "name" : "Some Cows", "species" : "Cattle", "count": 23 }
```

2. A group of pregnant ewes born in August to October 2021

```
{ "name" : "In-lamb Ewes", "species" : "Sheep", "count": 200,
  "sex": "Female", "birthPeriod": "2021-08-01/2021-10-31", "reproductiveStatus" : "Pregnant" }
```

