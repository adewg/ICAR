# Understanding and representing groups of animals

A significant majority of the ICAR Animal Data Exchange (ADE) specification deals with individual animals. There are messages that define individual animals and their attributes, and a large number of event observations for individual animals.

However, software systems for livestock management often also deal with groups of animals. The ICAR ADE specification supports two different ways of defining and interacting with groups of animals:
* Recording systems and technologies may wish to differentiate groups of individuals managed for feed, housing, health, or other reasons. This functionality is managed in ICAR ADE using *Animal Sets*.
*  There are also occassions where systems may wish to record farm activities carried out on a group of animals without identifying the individuals (in fact, the individual animals may not be known). This is achieved using *Group Events* and *Inventory Classifications*.

## Organising sets of individual animals

Farmers, recording systems and technologies often wish to manage groups of individual animals. These groups may only relate to a single day or activity (a "session"), or for a period of management in relation to a health treatment, reproduction, housing or feed, or for other purposes including long term comparisons and reports.

The primary mechanism for this is the **Animal Set**, represented by the [icarAnimalSetResource](../resources/icarAnimalSetResource.json).
Software systems may interchange an `icarAnimalSetResource` to identify the name and purpose of an animal set, and the animals it *currently* contains.

* The events [icarAnimalSetJoinEventResource](../resources/icarAnimalSetJoinEventResource.json) and [icarAnimalSetLeaveEventResource](../resources/icarAnimalSetLeaveEventResource.json) can be exchanged to record the history of animals added to or removed from animal sets over time.

* An animal set and its membership are one mechanism for grouping animals for the [icarStatisticsResource](../resources/icarStatisticsResource.json).

* When Group Events are recorded using resources based on [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.json) (see below), an embedded animal set may be used to define the animals involved in a larger group which might have been sampled in the event observation.

## Recording events on groups of animals

Sometimes software systems may record event observations that take place on groups of animals, and which cannot be conveniently allocated to the individual animals and recorded as individual events. Typical characterstics of such events are:
* The animals themselves may not be individually identified (for instance, extensive sheep systems),
* Animal identifications cannot be read individually (for instance, RFID tags are not used), and/or
* A sample of animals are recorded (and may indeed have individual events), but the event represents a larger group for farm management purposes.

Examples of these events include:
* Movement of groups of animals onto or off a location ([icarGroupMovementArrivalEventResource](../resources/icarGroupMovementArrivalEventResource.json), [icarGroupBirthEventResource](../resources/icarGroupMovementBirthEventResource.json), [icarGroupDeathEventResource](../resources/resources/icarGroupMovementDeathEventResource.json), [icarGroupDepartureEventResource](../resources/icarGroupMovementDepartureEventResource.json))
* Treatment of a group of animals (for instance, drenching a large number of animals with an anti-parasite remedy, [icarGroupTreatmentEventResource](../resources/icarGroupTreatmentEventResource.json))
* Recording an average weight or weight distribution for a group ([icarGroupWeightEventResource](../resources/icarGroupWeightEventResource.json))

These events are based on [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.json).

The group of animals represented is defined using an [icarInventoryClassificationType](../types/icarInventoryClassificationType.json), which may simply give the group a name, or may provide a set of shared characteristics of the animals (species, sex, breed, birth period) that can be used in farm management software.

