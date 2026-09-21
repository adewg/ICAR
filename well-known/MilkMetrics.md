# Defines well-known milk analysis metrics

These milk analysis metrics are intended for use with `icarAnalysisMetricType` and the `icarSampleAnalysisEventResource`.
Where possible, the characteristics codes and units are also aligned with `icarMilkCharacteristicsType`.


Characteristic | Name (EN) | Display Unit | UN/CEFACT Unit | UN/CEFACT Denominator <sup>1</sup> |
-- | -- | -- | -- | -- |
ACETONE | Acetone | mmol/l | M33 | 
BHB | Beta hydroxybutyrate|mmol/l|M33
BLOOD | Blood detected in milk | True / False | | 
BACTO | Bactoscan Count | IBC/mL | NCL | MLT 
FP | Milk Freezing Point | °C | CEL |
FAT | Milk Fat Percentage | % | P1 | 
FAT_KG | Milk Fat Mass | kg | KGM |
PAG |Pregnancy associated glycoprotein|mmol/l|M33
PRO <sup>2</sup> | Progesterone | mmol/l | M33
PROTEIN | Milk Protein Percentage | % | P1 | 
PROT_KG | Milk Protein Mass | kg | KGM |
LAC | Lactose Percentage | % | P1 | 
MS | Milk Solids Percentage | % | P1 | 
MS_KG | Milk Solids Mass | kg | KGM | 
UREA | Milk Urea | mg/dL | MGM | DLT 
UREA3 | 3 Day Average Milk Urea | mg/dL | MGM | DLT
MUN | Milk Urea Nitrogen | mg/dL | MGM | DLT
SCC | Somatic Cell Count | x1000 cells/mL <sup>3</sup> | NCL | MLT 
SCC10 | 10 Day Average SCC | cells/mL | NCL | MLT

Notes: 
1. The denominator is needed as while there are many pre-build UN/CEFACT combinations (e.g. cubic decilitres per hour), there are none for cells per millilitre or milligrams per decilitre. 
2. Progesterone is called PRO in milk characteristics, although this may cause confusion with protein. 
3. SCC can be specified in cells per ml or thousand (x1000) cells per ml. Milk characterstics uses x1000, though there is no UN/CEFACT way to represent this.

