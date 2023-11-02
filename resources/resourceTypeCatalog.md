# ICAR Resource Type Catalog

This document defines a set of URI identifiers and string short codes and maps them to ICAR resource types. 

The catalog is represented as a table with the columns, shortname, URI, `resourceType` discriminator link to resource resource type in github.

To help with readability and conciseness the URIs are represnted as CURIs (concise URIs) where the prefix is:

`icar`

and the expansion is:

`http://data.adewg.icar.org/core/`


Short Name             | URI                         | Discriminator (resourceType) | JSON Resource Type Definition
---                    | ---                         | --- | ---
Animal                 | icar:Animal                 | icarAnimalCoreResource | icarAnimalCoreResource.json
AnimalSetJoinEvent     | icar:AnimalSetJoinEvent     | icarAnimalSetJoinEventResource | icarAnimalSetJoinEventResource.json
AnimalSetLeaveEvent    | icar:AnimalSetLeaveEvent    | icarAnimalSetLeaveEventResource | icarAnimalSetLeaveEventResource.json
AnimalSet              | icar:AnimalSet              | icarAnimalSetResource | icarAnimalSetResource.json
BreedingValue          | icar:BreedingValue          | icarBreedingValueResource | icarBreedingValueResource.json
CarcassObservationsEvent  | icar:CarcassObservations    | icarCarcassObservationsEventResource | icarCarcassObservationsEventResource.json
Carcass                | icar:Carcass                | icarCarcassResource | icarCarcassResource.json
ConformationScoreEvent | icar:ConformationScoreEvent | icarConformationScoreEventResource | icarConformationScoreEventResource.json
DailyMilkingAverages   | icar:DailyMilkingAverages   | icarDailyMilkingAveragesResource | icarDailyMilkingAveragesResource.json
Device                 | icar:Device                 | icarDeviceResource | icarDeviceResource.json
DiagnosisEvent         | icar:DiagnosisEvent         | icarDiagnosisEventResource | icarDiagnosisEventResource.json
FeedIntakeEvent        | icar:FeedIntakeEvent        | icarFeedIntakeEventResource | icarFeedIntakeEventResource.json
FeedRecommendation     | icar:FeedRecommendation     | icarFeedRecommendationResource | icarFeedRecommendationResource.json
FeedReport             | icar:FeedReport             | icarFeedReportResource | icarFeedReportResource.json
Feed                   | icar:Feed                   | icarFeedResource | icarFeedResource.json
FeedStorage            | icar:FeedStorage            | icarFeedStorageResource | icarFeedStorageResource.json
Gestation              | icar:Gestation              | icarGestationResource | icarGestationResource.json
GroupFeedingEvent      | icar:GroupFeedingEvent      | icarGroupFeedingEventResource | icarGroupFeedingEventResource.json
GroupMovementArrivalEvent | icar:GroupMovementArrivalEvent | icarGroupMovementArrivalEventResource | icarGroupMovementArrivalEventResource.json
GroupMovementBirthEvent | icar:GroupMovementBirthEvent | icarGroupMovementBirthEventResource | icarGroupMovementBirthEventResource.json
GroupMovementDeathEvent | icar:GroupMovementDeathEvent | icarGroupMovementDeathEventResource | icarGroupMovementDeathEventResource.json
GroupMovementDepartureEvent | icar:GroupMovementDepartureEvent | icarGroupMovementDepartureEventResource | icarGroupMovementDepartureEventResource.json
GroupTreatmentEvent    | icar:GroupTreatmentEvent    | icarGroupTreatmentEventResource | icarGroupTreatmentEventResource.json
GroupWeightEvent       | icar:GroupWeightEvent       | icarGroupWeightEventResource | icarGroupWeightEventResource.json
HealthStatusObservedEvent | icar:HealthStatusObservedEvent | icarHealthStatusObservedEventResource | icarHealthStatusObservedEventResource.json
InventoryTransaction   | icar:InventoryTransaction   | icarInventoryTransactionResource | icarInventoryTransactionResource.json
Lactation              | icar:Lactation              | icarLactationResource| icarLactationResource.json
LactationStatusObservedEvent     | icar:LactationStatusObservedEvent     | icarLactationStatusObservedEventResource | icarLactationStatusObservedEventResource.json
Location               | icar:Location               | icarLocationResource | icarLocationResource.json
Medicine               | icar:Medicine               | icarMedicineResource | icarMedicineResource.json
MedicineTransaction    | icar:MedicineTransaction    | icarMedicineTransactionResource | icarMedicineTransactionResource.json
MilkPrediction         | icar:MilkPrediction         | icarMilkPredictionResource | icarMilkPredictionResource.json
MilkingDryOffEvent     | icar:MilkingDryOffEvent     | icarMilkingDryOffEventResource | icarMilkingDryOffEventResource.json
MilkingVisitEvent      | icar:MilkingVisitEvent      | icarMilkingVisitEventResource | icarMilkingVisitEventResource.json
MovementArrivalEvent   | icar:MovementArrivalEvent   | icarMovementArrivalEventResource | icarMovementArrivalEventResource.json
MovementBirthEvent     | icar:MovementBirthEvent     | icarMovementBirthEventResource | icarMovementBirthEventResource.json
MovementDeathEvent     | icar:MovementDeathEvent     | icarMovementDeathEventResource | icarMovementDeathEventResource.json
MovementDepartureEvent | icar:MovementDepartureEvent | icarMovementDepartureEventResource| icarMovementDepartureEventResource.json
ProcessingLot          | icar:ProcessingLot          | icarProcessingLotResource | icarProcessingLotResource.json
ProgenyDetails         | icar:ProgenyDetails         | icarProgenyDetailsResource | icarProgenyDetailsResource.json
Ration                 | icar:Ration                 | icarRationResource | icarRationResource.json
ReproAbortionEvent     | icar:ReproAbortionEvent     | icarReproAbortionEventResource | icarReproAbortionEventResource.json
ReproDoNotBreedEvent   | icar:ReproDoNotBreedEvent   | icarReproDoNotBreedEventResource | icarReproDoNotBreedEventResource.json
ReproEmbryoFlushingEvent | icar:ReproEmbryoFlushingEvent | icarReproEmbryoFlushingEventResource | icarReproEmbryoFlushingEventResource.json
ReproEmbryo            | icar:ReproEmbryo            | icarReproEmbryoResource | icarReproEmbryoResource.json
ReproHeatEvent         | icar:ReproHeatEvent         | icarReproHeatEventResource | icarReproHeatEventResource.json
ReproInseminationEvent | icar:ReproInsemonationEvent | icarReproInsemonationEventResource | icarReproInsemonationEventResource.json
ReproMatingRecommendation | icar:ReproMatingRecommendation | icarReproMatingRecommendationResource | icarReproMatingRecommendationResource.json
ReproParturitionEvent  | icar:ReproParturitionEvent  | icarReproParturitionEventResource | icarReproParturitionEventResource.json
ReproPregnancyCheckEvent | icar:ReproPregnancyCheckEvent | icarReproPregnancyCheckEventResource | icarReproPregnancyCheckEventResource.json
ReproSemenStraw        | icar:ReproSemenStraw        | icarReproSemenStrawResource | icarReproSemenStrawResource.json
ReproStatusObservedEvent | icar:ReproStatusObservedEvent | icarReproStatusObservedEventResource | icarReproStatusObservedEventResource.json
SchemeType             | icar:SchemeType | icarSchemeTypeResource | icarSchemeTypeResource.json
SchemeValue            | icar:SchemeValue | icarSchemeValueResource | icarSchemeValueResource.json
Statistics             | icar:Statistics             | icarStatisticsResource | icarStatisticsResource.json
TestDay                | icar:TestDay                | icarTestDayResource | icarTestDayResource.json
TestDayResult          | icar:TestDayResult          | icarTestDayResultResource | icarTestDayResultResource.json
TreatmentEvent         | icar:TreatmentEvent         | icarTreatmentEventResource | icarTreatmentEventResource.json
TreatmentProgramEvent  | icar:TreatmentProgramEvent  | icarTreatmentProgramEventResource | icarTreatmentProgramEventResource.json
WeightEvent            | icar:WeightEvent            | icarWeightEventResource| icarWeightEventResource.json
WithdrawalEvent        | icar:WithdrawalEvent        | icarWithdrawalEventResource | icarWithdrawalEventResource.json


