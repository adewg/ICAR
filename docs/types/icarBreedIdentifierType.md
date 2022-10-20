# Schema Type: icarBreedIdentifierType

The breed identifier type is a special case of an [icarIdentifierType](../types/icarIdentifierType.md).
It does not define any additional properties, and is only defined to make it clear to human readers of the JSON schema that the expected value is to represent a breed, defined by the managing authority of the breed list (scheme) and a unique value (id).

Some software may reduce this type to its base type of `icarIdentifierType`. This is fine.
