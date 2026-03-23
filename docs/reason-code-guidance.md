# Guidance for recording reason codes for departure, movement, and do not breed events.

Correctly understanding why animals have been removed from a farm, or have died, is very important for organisations that want to benchmark animal health and welfare, or support genetic improvement in animal health and resilience.

The ICAR ADE events affected by this consideration include:
* Deaths: `icarMovementDeathEventResource` and `icarGroupMovementDeathEventResource`
* Departures (animals sent off farm): `icarMovementDepartureEventResource` and `icarGroupMovementDepartureEventResource`
* Do Not Breed (individual only): `icarReproDoNotBreedEventResource`

Many software tools already have their own coding method, and breeding organisations and regional livestock tracing schemes have their own priorities for recording reason codes, often with an emphasis on local diseases and breeding objectives. As ICAR ADE is an interchange format, these local codes need to be adequately represented while also capturing the core essence of the reasons so they can be used for other purposes.

Accordingly, ICAR ADE supports three levels of reason code identification:
1. Standard reason enumerations for depatures (`icarDepartureReasonType`) and deaths (`icarDeathReasonType`).
2. Diagnosis codes for health and disease related reasons.
3. Extended Reason codes which allow for multiple reasons, and a local or regionally defined coding scheme. 

Additionally, death events provide a kind of death and disposal method enumeration, and departure events provide a departure kind that describes the method of departure.

Implementers providing data through ADE interfaces should implement reason coding in the order above:
* You MUST map your internal reason for departure, death, or not breeding to a standard reason code, even if this is less precise than your internal reason code.
* You SHOULD map your internal reason to an [ICAR Central Health Key](https://www.icar.org/guidelines/icar-central-health-key/) code (even a top level code can provide useful information) for Health, Metabolic, LegOrClaw, or Mastitis reasons, or other reasons where it is valid. Place this in `diagnosisCode` with the scheme `icar.disease` and the specific code in the `id` value. In specific cases where ADE is used for non-ruminant animals the VENOM veterinary coding scheme may be appropriate: see [well-known/icarDiagnosisIdentifier](../well-known/icarDiagnosisIdentifierType.md).
* You MAY wish to implement a local or regional specific reason identifier scheme with detail codes for your use case. If you do so, you MUST document your codes, and register the scheme in the [well-known/icarReasonIdentifierType](../well-known/icarReasonIdentifierType.md) list by making a pull request to ADE1.

## Using diagnosis codes
When mapping internal codes to the ICAR Central Health Key diagnosis codes, you may determine an appropriate level of detail based on the precision with which health causes are tracked in your system or use case. For instance, you may map Mastitis diseases to the disease code `1.13.` meaning anyinflammation of the mammary gland, or `1.13.1.` which describes that diagnosis by signs. If your internal reason coding scheme provides more detail, you may use the appropriate `1.13.x` codes.

For an API consumer, you can unpack the ICAR Central Health Key diagnosis codes and map them to the level of detail required for your use case. For instance, you may only be interested in Mastitis and would map all `1.13.x` codes to the same internal reason. However, if you might make this data available to other recipients, you SHOULD retain the original diagnosis code from your upstream source, to retain precision for other use cases.

## Interpreting the ADE Departure Reason Enumeration
ADE provides an enumeration of common, standard [departure reasons](../enums/icarDepartureReasonType.json). This table explains the meaning of these reasons in more detail.

| Enumeration Value | Description |
| --- | --- |
| Age | Use for animals removed from the herd or flock for age reasons (often called "Cull for Age"). |
| Superfluous | Use for animals removed to maintain herd or flock numbers at a planned level. Often lower performing animals are culled as superfluous without specific problems. |
| Slaughter | Use for animals sent for slaughter for processing to produce meat products. |
| Sale | Use for animals sent for sale (often called store sale) where the expected destination is likely to be another farm. |
| Newborn | Use for newborn progeny sent for off-farm rearing (may be sold or ownership retained for later return). |
| LegOrClaw | The decision to remove the animal(s) was made on the basis of leg, claw, foot, hoof problems. |
| Nutrition | The decision to remove the animal(s) was made because of eating or nutrition problems. Since the introduction of the _Metabolic_ value, that value may be more appropriate for metabolic problems. |
| Parturition | Use for animals removed on the basis of parturition (calving, lambing, kidding) related problems, particularly neo-natal and post-parturition problems. |
| Mastitis | Use to indicate udder inflamation or similar diseases as the cause of animal removal. |
| Fertility | Use for animals removed on the basis of fertility (failure of females to get in calf, or failure of males to get females pregnant). |
| Health | Use for animals removed because of health problems. SHOULD be combined with a `diagnosisCode` if possible. |
| Production | Use for animals removed because they do not meet expected production performance (milking, growth rates, or fibre production). |
| MilkingAbility | Use for animals removed from a dairy herd for milking ability (a range of performance problems during milking visits). |
| BadType | Use for animals removed because they do not meet the body type, conformation score, or breed characteristics expected. |
| Behaviour | Animals may be removed with this reason if they are aggressive, disruptive to the herd, or have other temperament or behaviour problems. |
| Other | Used where the reason for departure is known, but does not match any of the other specific reasons. May be used with a group movement where there are multple causes. |
| Unknown | Used when the reason for departure is NOT known. |
| Metabolic | Used when animals are removed because they suffer from metabolic problems or diseases. SHOULD be used with a `diagnosisCode` if this would help provide more information. |
| MaternalAbility | Used to indicate animals removed because they fail to successfully rear or feed their progeny. |
| ReproductiveFailure | Used to indicate animals removed for reproductive failure (for instance, abortion, repeated loss of embryos, born dead progeny). |
| BreedingIndex | Used when animals are removed because they do not meet a target breeding index (e.g. Euro Star or other national index). The actual cut-off value used is not specified here and may vary from farm to farm. |
| BodyCondition | Used when animals fail to achieve or maintain an adequate body condition, or for over-fat body condition. |
| Oral | Used to indicate animals removed for mouth or dental (teeth) problems. SHOULD be accompanied by a `diagnosisCode` if there is more information. |
| Accident | Animals that had to be taken off farm because of an accident or injury. |

## Interpreting the ADE Death Reason Enumeration.
ADE provides an enumeration of common, standard [death reasons](../enums/icarDeathReasonType.json) that describe reasons for animals dying on farm, if known.

| Enumeration Value | Description |
| --- | --- |
| Missing | Animals that cannot be located on farm and are presumed lost. |
| Parturition | Animals that died as a result of parturition, post-parturition, or near-parturition problems. |
| Disease | Animals that died or were euthanised as a result of a disease or health problem. SHOULD be used with a `diagnosisCode` if more details are known. |
| Accident | Animals that died or had to be euthanised as a result of an on-farm accident (e.g. fell into a ditch, or accident with farm machinery). |
| Consumption | Animals that were killed for various consumption purposes, which may be specific to the region and farm system. Examples include feeding farm dogs, used for human consumption on farm, or made available for natural predation. |
| Culled | Used to indicate animals euthanised because they are not required. **DEPRECATED - use Superfluous instead.** |
| Other | Use to indicate animals that died or were euthanised for reasons not included in this list (or for multiple reasons when used for group events). |
| Unknown | Use when the cause of death could not be established (genuinely not known). |
| Age | Use when animals were euthanised because of age, or age-related problems. |
| Mastitis | Animals that died or had to be euthanised because of udder inflammation (mastitus). SHOULD be used with a `diagnosisCode` if there are more details about the mastitis to be communicated. |
| Production | Animals that were euthanised because of poor production. |
| LegOrClaw | Animals that died or had to be euthanised because of lameness or disease of the leg, claw, hoof, or foot. |
| MilkingAbility | Animals that were euthanised because of poor milking ability or performance. |
 | Nutrition | Animals that died or euthanised because of a nutritive or metabolic disorder. SHOULD be combined with a `diagnosisCode` if possible. |
| Fertility | Animals that were euthanised because of poor fertility performance (failure to become pregnant, or to get females pregnant). |
| Superfluous | Used to indicate animals that euthanised because they are not required. |
