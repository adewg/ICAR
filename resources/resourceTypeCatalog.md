# ICAR Resource Type Catalog

This document defines a set of URI identifiers and string short codes and maps them to ICAR resource types. 

The catalog is represented as a table with the columns, shortname, `resourceType` discriminator, URI, and name of the resource schema file.

To help with readability and conciseness the URIs are represnted as CURIs (concise URIs) where the prefix is:

`icar`

and the expansion is:

`http://data.adewg.icar.org/core/`


Short Name             | Discriminator (resourceType) | URI (future use)   | JSON Resource Type Definition
--- | --- | --- | ---
Animal | **icarAnimalCoreResource** | icar:Animal | icarAnimalCoreResource.json
AnimalSetJoinEvent | **icarAnimalSetJoinEventResource** | icar:AnimalSetJoinEvent     | icarAnimalSetJoinEventResource.json
AnimalSetLeaveEvent | **icarAnimalSetLeaveEventResource** | icar:AnimalSetLeaveEvent | icarAnimalSetLeaveEventResource.json
AnimalSet | **icarAnimalSetResource** | icar:AnimalSet | icarAnimalSetResource.json
AttentionEvent  | **icarAttentionEventResource** | icar:AttentionEvent | icarAttentionEventResource.json 
BreedingValue | **icarBreedingValueResource** | icar:BreedingValue | icarBreedingValueResource.json
CarcassObservationsEvent | **icarCarcassObservationsEventResource** | icar:CarcassObservations | icarCarcassObservationsEventResource.json
Carcass | **icarCarcassResource** | icar:Carcass | icarCarcassResource.json
ConformationScoreEvent | **icarConformationScoreEventResource** | icar:ConformationScoreEvent | icarConformationScoreEventResource.json
DailyMilkingAverages | **icarDailyMilkingAveragesResource** | icar:DailyMilkingAverages | icarDailyMilkingAveragesResource.json
Device | **icarDeviceResource** | icar:Device | icarDeviceResource.json
DiagnosisEvent | **icarDiagnosisEventResource** | icar:DiagnosisEvent | icarDiagnosisEventResource.json
FeedIntakeEvent | **icarFeedIntakeEventResource** | icar:FeedIntakeEvent | icarFeedIntakeEventResource.json
FeedRecommendation | **icarFeedRecommendationResource** | icar:FeedRecommendation | icarFeedRecommendationResource.json
FeedReport | **icarFeedReportResource** | icar:FeedReport | icarFeedReportResource.json
Feed | **icarFeedResource** | icar:Feed | icarFeedResource.json
FeedStorage | **icarFeedStorageResource** | icar:FeedStorage | icarFeedStorageResource.json
FeedTransaction | **icarFeedTransactionResource** | icar:FeedTransaction | icarFeedTransactionResource.json
Gestation | **icarGestationResource** | icar:Gestation | icarGestationResource.json
GroupFeedingEvent | **icarGroupFeedingEventResource** | icar:GroupFeedingEvent | icarGroupFeedingEventResource.json
GroupMovementArrivalEvent | **icarGroupMovementArrivalEventResource**| icar:GroupMovementArrivalEvent | icarGroupMovementArrivalEventResource.json
GroupMovementBirthEvent | **icarGroupMovementBirthEventResource** | icar:GroupMovementBirthEvent | icarGroupMovementBirthEventResource.json
GroupMovementDeathEvent | **icarGroupMovementDeathEventResource** | icar:GroupMovementDeathEvent | icarGroupMovementDeathEventResource.json
GroupMovementDepartureEvent | **icarGroupMovementDepartureEventResource** | icar:GroupMovementDepartureEvent | icarGroupMovementDepartureEventResource.json
GroupTreatmentEvent | **icarGroupTreatmentEventResource** | icar:GroupTreatmentEvent | icarGroupTreatmentEventResource.json
GroupWeightEvent | **icarGroupWeightEventResource** | icar:GroupWeightEvent | icarGroupWeightEventResource.json
HealthStatusObservedEvent | **icarHealthStatusObservedEventResource** | icar:HealthStatusObservedEvent | icarHealthStatusObservedEventResource.json
InventoryTransaction | **icarInventoryTransactionResource** | icar:InventoryTransaction | icarInventoryTransactionResource.json
Lactation | **icarLactationResource** | icar:Lactation | icarLactationResource.json
LactationStatusObservedEvent | **icarLactationStatusObservedEventResource** | icar:LactationStatusObservedEvent | icarLactationStatusObservedEventResource.json
Location | **icarLocationResource** | icar:Location | icarLocationResource.json
Medicine | **icarMedicineResource** | icar:Medicine | icarMedicineResource.json
MedicineTransaction | **icarMedicineTransactionResource** | icar:MedicineTransaction | icarMedicineTransactionResource.json
MilkingDryOffEvent | **icarMilkingDryOffEventResource** | icar:MilkingDryOffEvent | icarMilkingDryOffEventResource.json
MilkingVisitEvent | **icarMilkingVisitEventResource** | icar:MilkingVisitEvent | icarMilkingVisitEventResource.json
MilkPrediction | **icarMilkPredictionResource** | icar:MilkPrediction | icarMilkPredictionResource.json
MovementArrivalEvent | **icarMovementArrivalEventResource** | icar:MovementArrivalEvent | icarMovementArrivalEventResource.json
MovementBirthEvent | **icarMovementBirthEventResource** | icar:MovementBirthEvent | icarMovementBirthEventResource.json
MovementDeathEvent | **icarMovementDeathEventResource** | icar:MovementDeathEvent | icarMovementDeathEventResource.json
MovementDepartureEvent | **icarMovementDepartureEventResource** | icar:MovementDepartureEvent | icarMovementDepartureEventResource.json
ProcessingLot | **icarProcessingLotResource** | icar:ProcessingLot | icarProcessingLotResource.json
ProgenyDetails | **icarProgenyDetailsResource** | icar:ProgenyDetails | icarProgenyDetailsResource.json
Ration | **icarRationResource** | icar:Ration | icarRationResource.json
ReproAbortionEvent | **icarReproAbortionEventResource** | icar:ReproAbortionEvent | icarReproAbortionEventResource.json
ReproDoNotBreedEvent | **icarReproDoNotBreedEventResource** | icar:ReproDoNotBreedEvent | icarReproDoNotBreedEventResource.json
ReproEmbryoFlushingEvent | **icarReproEmbryoFlushingEventResource** | icar:ReproEmbryoFlushingEvent | icarReproEmbryoFlushingEventResource.json
ReproEmbryo | **icarReproEmbryoResource** | icar:ReproEmbryo | icarReproEmbryoResource.json
ReproHeatEvent | **icarReproHeatEventResource** | icar:ReproHeatEvent | icarReproHeatEventResource.json
ReproInseminationEvent | **icarReproInsemonationEventResource** | icar:ReproInsemonationEvent | icarReproInsemonationEventResource.json
ReproMatingRecommendation | **icarReproMatingRecommendationResource** | icar:ReproMatingRecommendation | icarReproMatingRecommendationResource.json
ReproParturitionEvent | **icarReproParturitionEventResource** | icar:ReproParturitionEvent | icarReproParturitionEventResource.json
ReproPregnancyCheckEvent | **icarReproPregnancyCheckEventResource** | icar:ReproPregnancyCheckEvent | icarReproPregnancyCheckEventResource.json
ReproSemenStraw | **icarReproSemenStrawResource** | icar:ReproSemenStraw | icarReproSemenStrawResource.json
ReproStatusObservedEvent | **icarReproStatusObservedEventResource** | icar:ReproStatusObservedEvent | icarReproStatusObservedEventResource.json
SchemeType | **icarSchemeTypeResource** | icar:SchemeType | icarSchemeTypeResource.json
SchemeValue | **icarSchemeValueResource** | icar:SchemeValue | icarSchemeValueResource.json
Statistics | **icarStatisticsResource** | icar:Statistics | icarStatisticsResource.json
TestDay | **icarTestDayResource** | icar:TestDay | icarTestDayResource.json
TestDayResult | **icarTestDayResultResource** | icar:TestDayResult | icarTestDayResultResource.json
TreatmentEvent | **icarTreatmentEventResource** | icar:TreatmentEvent | icarTreatmentEventResource.json
TreatmentProgramEvent | **icarTreatmentProgramEventResource** | icar:TreatmentProgramEvent | icarTreatmentProgramEventResource.json
TypeClassificationEvent | **icarTypeClassificationEventResource** | icar:TypeClassificationEvent | icarTypeClassificationEventResource.json
WeightEvent | **icarWeightEventResource** | icar:WeightEvent | icarWeightEventResource.json
WithdrawalEvent | **icarWithdrawalEventResource** | icar:WithdrawalEvent | icarWithdrawalEventResource.json


