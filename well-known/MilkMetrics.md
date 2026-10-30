# Defines well-known milk analysis metrics

These milk analysis metrics are intended for use with `icarAnalysisMetricType` and the `icarSampleAnalysisEventResource`.
Where possible, the characteristics codes and units are also aligned with `icarMilkCharacteristicsType`.


Characteristic | Name (EN) | Display Unit | QUDT unitOfMeasureCode | UN/CEFACT Unit | UN/CEFACT Denominator <sup>1</sup> |
-- | -- | -- | -- | -- | -- |
ACETONE | Acetone | mmol/l | [unit:MilliMOL-PER-L](https://qudt.org/vocab/unit/MilliMOL-PER-L) | M33 | 
BHB | Beta hydroxybutyrate|mmol/l| [unit:MilliMOL-PER-L](https://qudt.org/vocab/unit/MilliMOL-PER-L) | M33
BLOOD | Blood detected in milk | True / False | | |
BACTO | Bactoscan Count | IBC/mL | [unit:NUM-PER-MilliL](https://qudt.org/vocab/unit/NUM-PER-MilliL) | NCL | MLT 
FP | Milk Freezing Point | °C | [unit:DEG_C](https://qudt.org/vocab/unit/DEG_C) | CEL |
FAT | Milk Fat Percentage | % | [unit:PERCENT](https://qudt.org/vocab/unit/PERCENT) | P1 | 
FAT_KG | Milk Fat Mass | kg | [unit:KiloGM](https://qudt.org/vocab/unit/KiloGM) | KGM |
PAG |Pregnancy associated glycoprotein|mmol/l|[unit:MilliMOL-PER-L](https://qudt.org/vocab/unit/MilliMOL-PER-L) | M33 | |
PRO <sup>2</sup> | Progesterone | mmol/l | [unit:MilliMOL-PER-L](https://qudt.org/vocab/unit/MilliMOL-PER-L) | M33
PROTEIN | Milk Protein Percentage | % | [unit:PERCENT](https://qudt.org/vocab/unit/PERCENT) | P1 | 
PROT_KG | Milk Protein Mass | kg | [unit:KiloGM](https://qudt.org/vocab/unit/KiloGM) | KGM |
LAC | Lactose Percentage | % | [unit:PERCENT](https://qudt.org/vocab/unit/PERCENT) | P1 | 
MS | Milk Solids Percentage | % | [unit:PERCENT](https://qudt.org/vocab/unit/PERCENT) | P1 | 
MS_KG | Milk Solids Mass | kg | [unit:KiloGM](https://qudt.org/vocab/unit/KiloGM) | KGM | 
UREA | Milk Urea | mg/dL | [unit:MilliGM-PER-DeciL](https://qudt.org/vocab/unit/MilliGM-PER-DeciL) | MGM | DLT 
UREA3 | 3 Day Average Milk Urea | mg/dL | [unit:MilliGM-PER-DeciL](https://qudt.org/vocab/unit/MilliGM-PER-DeciL) | MGM | DLT
MUN | Milk Urea Nitrogen | mg/dL |  [unit:MilliGM-PER-DeciL](https://qudt.org/vocab/unit/MilliGM-PER-DeciL) | MGM | DLT
SCC | Somatic Cell Count | cells/mL <sup>3</sup> | [unit:NUM-PER-MilliL](https://qudt.org/vocab/unit/NUM-PER-MilliL) | NCL | MLT 
SCC10 | 10 Day Average SCC | cells/mL | [unit:NUM-PER-MilliL](https://qudt.org/vocab/unit/NUM-PER-MilliL) | NCL | MLT

Notes: 
1. The denominator is needed for UN/CEFACT units as while there are many pre-built UN/CEFACT combinations (e.g. cubic decilitres per hour), there are none for cells per millilitre or milligrams per decilitre. Using QUDT units as an option solves this.
2. Progesterone is called PRO in milk characteristics, although this may cause confusion with protein. 
3. SCC can be specified in cells per ml or thousand (x1000) cells per ml. Milk characterstics uses x1000, though there is no UN/CEFACT way to represent this. We are proposing here to use full number (ie. x 1000).

