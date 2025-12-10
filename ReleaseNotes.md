## Release notes for ADE v1.5.1
ADE 1.5.x provides greater support for code generation from Open API specifications.
In particular:
- OpenAPI files and JSON schemas have been adjusted to work with OpenAPI 3.1 (implemented in ADE 1.4 release)
- There are multiple OpenAPI files in the [url-schemes](https://github.com/adewg/ICAR/tree/ADE-1/url-schemes) folder. You will always find simple GET examples in the exampleUrlScheme.json, and other files contain examples of GET, POST, and batch POST methods for feeds, health, management, milk, performance, registration, reproduction, and sorting resources.
- **Importantly** the [bundled-schemes](https://github.com/adewg/ICAR/tree/ADE-1/bundled-schemes) folder contains a generated [combinedURLScheme.json](https://github.com/adewg/ICAR/blob/ADE-1/bundled-schemes/combinedURLScheme.json) OpenAPI specification that combines all resources into a single scheme. We encourage you to target this for code generation into your language of choice.

Contributors have found success using recent versions of [OpenAPI Generator](https://openapi-generator.tech/) that support OpenAPI 3.1 to generate code for C# and Java. If you are targeting Python, consider the [ICAR-Pydantic](https://github.com/adewg/ICAR-pydantic) Github project and repository.

# Specific fixes from v1.5.0 to v1.5.1:
1. Fix a problem with the scripts that generated the bundled combinedURLScheme.json with the wrong OpenAPI version.
2. Create a new icarAnimalBaseResource (type) that is inherited by both icarAnimalCoreResource and icarProgenyDetailsResource. This allows some requested/expected optional progeny attributes to be available for parturition events. This has been tested with C# and Java code generation and does not seem to break anything with Animal APIs.

You can see the full list of changes at [the ADE 1.5.1 Release](https://github.com/adewg/ICAR/releases/tag/v1.5.0) or in the [changelog](https://github.com/adewg/ICAR/blob/ADE-1/CHANGELOG.md)


# Changes from previous versions of ADE

If you have implemented ADE 1.3.x you will find changes to `icarStatisticsResource` which corrects the use of arrays in that version, and changes to `icarWithdrawalEventResource` and `icarConsignmentType` which relate to inheritance/aggregation problems that have been fixed. 

ADE 1.4.x and up also made the following changes:
- URL schemes have been updated to OpenAPI Specification OAS3.1
- JSON Schema semantics have been updated correspondingly to use JSON Schema 2020-12
- In icarResource, meta SHOULD be considered required, and in icarMetaDataType, the source and sourceId SHOULD both be considered required.
- Some manufacturer-specific attributes of icarReproHeatEventResource are deprecated.
- In icarResourceReferenceType, the attributes @context, @id, and @type are deprecated. Use the new attributes instead.

If you have implemented ADE 1.2.x, you will find that `ResourceType` is now fully specified as a string and (mandatory) discriminator, which was necessary to support deserialisation of objects from JSON into generated code.


