# Well-known Carcass Metric Schemes and Metrics
This file allows organisations to specify carcass (or carcase) observation identifiers (metrics)
Each metric has:
- A scheme (either a common scheme or a county- or organisation-specific scheme)
- A metric id (the id component of the identifer type) which identifies a specific metric within the scheme
- Typical Units (UN-CEFACT abbreviation where possible)
- Method of measurement (if multiple methods are supported)
- Additional qualifier for the metric or method if required for clarity.

## Schemes
| Scheme Short URI | Resolvable URI | Organisation | Description |
| --- | --- | --- | --- |
| org.icar.carcass | https://www.icar.org/index.php/icar-recording-guidelines/ | ICAR | Common carcass metrics that are likely to be used internationally. Defined to save every country having to create its own. |

## Well-known Metrics
| Scheme URI | Metric ID | Description | Units | Methods | Qualifiers |
| --- | --- | --- | --- | --- | --- |
| org.icar.carcass | liveWeight | Live animal weight immediately prior to slaughter. Should be recorded with a known time off feed. Desired accuracy to nearest kg or 0.5 kg. | KGM  | weighScales |  |
| org.icar.carcass | deadWeight | Animal weight immediately after slaughter and prior to cutting. Should be recorded with a known time off feed. Desired accuracy to nearest kg or 0.5 kg. | KGM  | weighScales |  |
| org.icar.carcass | hotCarcassWeight | Carcass weight of an animal after slaughter and trim, and before washing and chilling. Depending on species, may be recorded for the full carcass or each side. Desired accuracy to 1 decimal place. | KGM  | weighScales |  |
| org.icar.carcass | coldCarcassWeight | Carcass weight of an animal after slaughter, trim, washing, and chilling. Depending on species, may be recorded for the full carcass or each side. Desired accuracy to 1 decimal place. | KGM | weighScales |  |
| org.icar.carcass | eyeMuscleArea | Area of the surface of the M.longissimus dorsi at the ribbing site. | CMK | visual, directMeasure, imaging, ultrasound |  |
| org.icar.carcass | fatColor | The colour of intermuscular fat lateral to the eye muscle assessed on the chilled carcase; from 1 (pure white) to 9 (creamy yellow). | visual, imaging |  |  |
| org.icar.carcass | meatColor | The colour of the eye muscle assessed on the chilled carcase; from 1 (pink) to 7 (dark maroon) | visual, imaging |  |  |
| org.icar.carcass | fatDepth | One-dimensional measurement of subcutaneous fat over a quartered rib site. In cattle, the P8 site is used. In sheep, the GR site is typically used. | MMT | visual, directMeasure, imaging, ultrasound | P8, GR |
| org.icar.carcass | marbling | An assessment of intramuscular fat (IMF) within the lean of the ribeye muscle, scored from 0 (lean) to 9 (high marbling) | visual, imaging, ultrasound |  |  |
| org.icar.carcass | dentition | A measure of the eruption of permanent incisor teeth. Dentition is not a method to accurately measure chronological age, maturity, or eating quality, but may be used as a way to categorise carcasses. Assessed in even numbers (2-tooth, 4-tooth) |  | visual |  |
| org.icar.carcass | dressingPercentage | The mathematical relationship between animal liveweight immediately before slaughter (or deadweight) and the trimmed hot carcass weight, calculated as hot carcass weight, divided by liveweight, multiplied by 100. Usually expressed to 0 or 1 decimal place. | P1 | calculated |  |
|  |  |  |  |  |  |

