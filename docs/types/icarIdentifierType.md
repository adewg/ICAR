# Schema Type: icarIdentifierType

Many entities in the ICAR Animal Data Exchange have a unique identification that is controlled or managed by an issuing body or scheme.
For instance:
- An animal identifier may be issued by and conform with the rules of a national animal identification scheme.
- A location identifier may by issued by and conform to the requirements of a national business idenfification scheme.
- A livestock breed may be one of the valid values in a list maintained by an animal recording service or society.

## Properties

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| scheme | string | Yes | The identifier (in reverse domain format) of an official scheme that manages unique identifiers. |
| id | string | Yes | A unique identification for the resource issued under the auspices of the scheme. |

## Well-known Schemes
Some identifier schemes for various types of identifier are listed in the `well-known` folder in the ICAR Animal Data Exchange GitHub repository:
* [icarAnimalIdentifierType](../../well-known/icarAnimalIdentifierType.md)
* [icarBreedIdentifierType](../../well-known/icarBreedIdentifierType.md)
* [icarDiagnosisIdentifierType](../../well-known/icarDiagnosisIdentifierType.md)
* [icarFeedIdentifierType](../../well-known/icarFeedIdentifierType.md)
* [icarLocationIdentifierType](../../well-known/icarLocationIdentifierType.md)
* [icarMedicineIdentifierType](../../well-known/icarMedicineIdentifierType.md)
* [icarPropertyIdentifierType](../../well-known/icarPropertyIdentifierType.md)
* [icarTraitLabelIdentifierType](../../well-known/icarTraitLabelIdentifierType.md)



