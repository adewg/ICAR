# ICAR Animal Data Exchange JSON Standards V1.3
The repository contains the JSON standard for Animal Data Exchange (ADE) produced by the International Committee for Animal Recording (ICAR). 

The content of this repository is licenced using the Apache 2.0 Licence. You are encouraged to use it in your data exchanges and other applications, and also to contribute to the further development of the standard.

## Normative Sections

There are three key areas of this standard:

1. The JSON Schema for Data Types: [JSON ICAR Resource Types](./resources/)
2. The URL Schemes and Open API for location centric applications: [Application API](./url-schemes)
3. The Generic Data API for data exchange: [Generic Data API](generic-data-api.md) 

## Compliance

There is no formal compliance defined beyond that implied by the JSON Schema for data types and as stated in the relevant API documentation. 

## Documentation
You can find the documentation for this project in [the Wiki](https://github.com/adewg/ICAR/wiki).

There you will find:
* Information about [ICAR and the ADE working group](https://github.com/adewg/ICAR/wiki/About-ICAR-and-ADE)
* The design principles considered by the ADE working group when developing the standard
* How to understand the data model and what [resources we support](https://github.com/adewg/ICAR/wiki/Resource-entities)
* Tips for [implementing a client application](https://github.com/adewg/ICAR/wiki/Implementing-a-client-application) using the standard
* Tips for [implementing a service](https://github.com/adewg/ICAR/wiki/Implementing-a-service) using the standard

## OpenAPI Quick Start
Developers may wish to start by reading OpenAPI specification examples in the **\url-schemes** folder in their favourite OpenAPI specification editor.
You can also [view the basic example Url Scheme using the swagger editor](https://editor.swagger.io/?url=https://raw.githubusercontent.com/adewg/ICAR/ADE-1/url-schemes/exampleUrlScheme.json).

## Code Generation 
Developers will likely take one or more of the **url-schemes** and generate their own code wrappers using **[openapi-generator](https://github.com/OpenAPITools/openapi-generator)** or an equivalent generation tool. Version 1.2 of this specification has been tested with OpenAPI Generator version 5.2.0 and conforms to the OpenAPI '3.0' specification as much as possible (and JSON Schema 7). There are some known issues with Nullable reference types, as documented in issue #214. In particular, .NET code generation can sometimes ignore the nullable intention, and Java code generation will generate semantically different outcomes depending on the value of the openApiNullable parameter for code generation. [See issue 214 for more details](https://github.com/adewg/ICAR/issues/214).

## Acknowledgements
Version 1.3 of this standard was based on previous work of:
* The ICAR ADE working group XML standard
* [DataLinker](https://datalinker.org)
* [JoinData](https://www.join-data.nl/)
* [MIMIRO Open](https://open.mimiro.io)
* And many other contributors

## Contributing
The Animal Data Exchange Working Group welcome contributions
* Read and make suggestions using the [Issues List](https://github.com/adewg/ICAR/issues)
* The default branch is set to **ADE-1** which is the current release. This is to make it easier for organisations to clone and use the specifications. If you expect to contribute you will need to work on the **Develop** branch instead.
* Propose changes by logging an issue, then creating your own fork of the **Develop** branch and proposing a Pull Request that will be reviewed by the maintainers.


