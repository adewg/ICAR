# Identifier Types in the ICAR ADE Schema

There are many cases where entities in the ICAR Animal Data Exchange (ADE) schema need identifiers. Animals, locations, semen straws, medicines and many other items need to be identified, and in many cases there is no single globally accepted identification scheme for an entity.

Instead, ICAR ADE defines a two-part identifier, containing:
| Component | Description |
| --- | --- |
| **scheme** | A URI that identifies the local, national, or other identifier scheme being used. |
| **id** | An identifier isssued under, or in compliance with the specified scheme. |

This is similar to other constructs used in Internet applications, including the use of namespaces or uniform resource name (URN) identifiers. 

The scheme + id identifier combination can be used for:
* Identifiers issued in compliance with a scheme (for instance, Interbull animal identifiers)
* Codes defined under a recognised coding scheme (for instance, VENOM veterinary nomenclature codes)

Within the ICAR ADE JSON Schema you will encounter [icarIdentifierType](../types/icarIdentifierType.json) which is the base type for identifiers. This is subclassed by reference to create identifier types for specific purposes. Subclasses do not introduce any additional fields - they merely clarify the types of identifiers that are expected in that place.

Here is the list of subclassed identifiers, their purpose, and the list of well-known values for each type. You may add additional well-known values to the specific markdown files.
| Identifier Type | Purpose | Well-known Identifiers |
| --- | --- | --- |
| [icarAnimalIdentifierType](../types/icarAnimalIdentifierType.json) | Issued animal identifiers. | [icarAnimalIdenfierType.md](../well-known/icarAnimalIdenfierType.md) |
| [icarBreedIdentifierType](../types/icarBreedIdentifierType.json) | Identifier schemes for breeds. | [icarBreedIdentifierType.md](../well-known/icarBreedIdentifierType.md) |
| [icarBVBaseIdentifierType](../types/icarBVBaseIdentifierType.json) | Identifier schemes for breeding value calculation methods or organisations. | [icarBVBaseIdentifierType.md](../well-known/icarBVBaseIdentifierType.md) | 
| [icarDiagnosisIdentifierType](../types/icarDiagnosisIdentifierType.json) | Identifier schemes for diagnosis codes. | [icarDiagnosisIdentifierType.md](../well-known/icarDiagnosisIdentifierType.md) | 
| [icarFeedIdentifierType](../types/icarFeedIdentifierType.json) | Identifier schemes for livestock feeds. | [icarFeedIdentifierType.md](../well-known/icarFeedIdentifierType.md) |
| [icarLocationIdentifierType](../types/icarLocationIdentifierType.json) | Identifier schemes for herd or farm locations. | [icarLocationIdentifierType.md](../well-known/icarLocationIdentifierType.md) |
| [icarMedicineIdentifierType](../types/icarMedicineIdentifierType.json) | Identifier schemes for national medicine registration. | [icarMedicineIdentifierType.md](../well-known/icarMedicineIdentifierType.md) |
| [icarPropertyIdentifierType](../types/icarPropertyIdentifierType.json) | Identification schemes for feed properties. | [icarPropertyIdentifierType.md](../well-known/icarPropertyIdentifierType.md) |
| [icarTraitLabelIdentifierType](../types/icarTraitLabelIdentifierType.json) | National or industry trait labels. | [icarTraitLabelIdentifierType.md](../well-known/icarTraitLabelIdentifierType.md) |
