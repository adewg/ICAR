# Reproduction Events - good practices and implementation advice

We are often asked about the multiple `icarRepro`xxx events and how they should best be used together to support different variations of livestock reproduction management. This page provides a short overview of ICAR ADE reproduction events and resources, and considerations for their use.

ICAR ADE events are most complete for individual animal recording. There could be reproduction-related events that affect groups or sets of animals (for instance, running bulls with cows, or putting out rams for group mating). These are not currently supported, so you won't find them documented here. They could be added in due course - proposals are always welcome.

## Reproduction-related events
Here is a list of reproduction-related events.
| Event name | ICAR resource name | Intended use |
| --- | --- | --- |
| Heat | [icarReproHeatEventResource`](../resources/icarReproHeatEventResource.json) | Used to record a heat observation by human or machine. |
| Do Not Breed | [icarReproDoNotBreedEventRsource](../resources/icarReproDoNotBreedEventResource.json) | Used to indicate that the animal should not be inseminated (and why). |
| Embry Flushing | [icarReproEmbryoFlushingEventResource](../resources/icarReproEmbryoFlushingEventResource.json) | A record of embryo flushing and collection, recorded against the donor (genetic) dam. |
| Insemination | [icarReproInseminationEventResource](../resources/icarReproInseminationEventResource.json) | Records a mating for a dam (female)- natural, artificial insemination, or embryo transfer. |
| Pregnancy Check | [icarReproPregnancyCheckEventResource](../resources/icarReproPregnancyCheckEventResource.json) | Used to record pregnancy diagnosis for a female, including methods, results, and foetal information. |
| Status Observation | [icarReproStatusObservedEventResource](../resources/icarReproStatusObservedEventResource.json) | Records an observed reproductive status for a female without necessarily requiring a pregnancy check, parturition, or other specific event. |
| Abortion | [icarReproAbortionEventResource](../resources/icarReproAbortionEventResource.json) | Records an observation for a female that an abortion has taken place. |
| Parturition | [icarReproParturitionEventResource](../resources/icarReproParturitionEventResource.json) | Event for recording parturition (calving, lambing, kidding, fawning) for the dam (female). Includes progeny details, calving ease, and parity information. |
| Birth registration (progeny) | [icarMovementBirthEventResource](../resources/icarMovementBirthEventResource.json) | Used to record the birth registration for a progeny (the calf, lamb, etc), separate from the parturition record of its mother. |

## Other reproduction-related resources and types
These resources and types are used or referenced by the reproduction events.
| Resource name | ICAR resource name | Intended use |
| --- | --- | --- |
| Mating recommendation | [icarReproMatingRecommendationResource](../resources/icarReproMatingRecommendationResource.json) | Provides one sire recommendation for the female animal being considered. |
| Embryo | [icarReproEmbryoResource](../resources/icarReproEmbryoResource.json) | Provides details about an embryo used in an embryo transfer, including ID, donor (genetic) dam, and sire. |
| Semen Straw | [icarReproSemenStrawResource](../resources/icarReproSemenStrawResource.json) | Provides details about a semen straw used in artificial insemination. |
| Progeny details | [icarProgenyDetailsResource](../resources/icarProgenyDetailsResource.json) | Used to provide information about each progeny (including dead, untagged progeny) in a parturition event. |
| New animal details | [icarAnimalCoreResource](../resources/icarAnimalCoreResource.json) | As a birth registration event `icarMovementBirthEventResource` may arrive independently of animal data, an embedded animal resource provides details of the newly registered animal. |
| Sire information | [icarReproSireInfoType](../types/icarReproSireInfoType.json) | Embedded within multiple reproductive events and resources that need consistent sire information. |

> ## Advice for implementers using code generation prior to version 1.6
> The addition of `icarReproSireInfoType` allows consistent sire information across all the reproductive resource types, and does not cause a breaking change to either the JSON Schema and also does not cause any change the representation of data in ADE JSON. However, you may find that code generation causes intermediate classes to be generated in some languages. These should be minor changes that you can readily address with small modifications to your code.

## Frequently Asked Questions

### 1. Should I record a heat event or use an attention event to record a heat?
A device system may provide attention events ([icarAttentionEventResource](../resources/icarAttentionEventResource.json)) that indicate information about an animal from sensor observations. The attention event can indicate that a heat may have occurred. However, the device system or farm management software or other animal recording system should ALSO record an `icarReproHeatEventResource` to provide consistent heat information for other services.

### 2. There are lots of sire information fields, especially for the insemination event. Which ones should I use?
You are correct. There are sire information attributes in the `icarReproInseminationEventResource`, the `icarReproEmbryoResource`, and the `icarReproSemenStrawResource`. We recommend that:
* If you have used natural mating, record sire information directly in `icarReproInseminationEventResource`.
* If you used artificial insemination (semen), populate the `straw` attribute, which is an `icarReproSemenStrawResource` and put sire information in there rather than in the insemination resource itself.
* If you carried out an embryo transfer, populate the `embryo` attribute, which is an `icarReproEmbryoResource` and put sire information in there rather than in the insemination resource or straw.

Always set the `inseminationType` so that a system receiving the event knows which to expect.

### 3. What should I do if we have a staw with semen from several sires, or used natural mating with a group of sires?
For a semen straw, the `icarReproSemenStawResource` can hold information about the batch of semen, and an external source could provide more information. Otherwise, you could use the `sireIdentifiers[]` array to hold the official identifiers of the participating sires, rather than alternative identifiers for a single sire. The `scheme` of the identifier will help a system receiving that information to understand that all identifiers are from the same official scheme and therefore must represent multiple sires.

For natural mating, you can take the same approach. Put the official identifiers of the multiple sires into the `sireIdentifiers[]` array within the insemination resource. For a system receiving this data, use of the same `scheme` for each member of the array demonstrates that there are multiple sires, not alternative identifiers.

### 4. Do I need to record both parturition events and birth registration events?
This will depend on a use case, but the events carry different information, despite their similarities.
* `icarReproParturitionEventResource` is an event recorded on the dam (mother). As it is focused on the dam, it may carry minimal progeny information, or the progeny may not be tagged with an identifier when the event is recorded.
* `icarMovementBirthEventResource` is recorded when an animal is registered with a recording service as having been born (it can also be used for the first registration of existing animals at a location into a recording programme). 

We recommend supporting both events if possible, but some countries are able to imply a progeny birth registration if the progeny details are provided in the parturition event.
