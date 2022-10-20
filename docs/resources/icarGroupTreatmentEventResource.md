# Schema Resource : icarGroupTreatmentEventResource

This resource represents a treatment carried out on a group of animals, for instance a drench against parasites, or a vaccination.

## Properties

Contains all the properties defined in [icarGroupEventCoreResource](../resources/icarGroupEventCoreResource.md).

| Name | Type | Required | Description and notes |
| --- | --- | --- | --- |
| medicine | [icarMedicineReferenceType](../types/icarMedicineReferenceType.md) | - | A reference to the medicine used (where applicable). |
| procedure | string | - | Medicine application method or a non-medicine procedure. |
| batches | array of [icarMedicineBatchType](../types/icarMedicineBatchType.md) | - | Batches and expiry details for the medicine administered. |
| withdrawals | array of [icarMedicineWithdrawalType](../types/icarMedicineWithdrawalType.md) | - | Withholding details for the treatment administered. |
| dosePerAnimal | [icarMedicineDoseType](../types/icarMedicineDoseType.md) | - | The actual or average medicine dose administered per animal. |
| totalMedicineUsed | [icarMedicineDoseType](../types/icarMedicineDoseType.md) | - | The total amount of medicine used. |
| site | string | - | Body site where the treatment was administered. |
| positions | array of [icarPositionType](../types/icarPositionType.md) | - | The body positions treated. |
