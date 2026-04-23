# Well-known Animal Identifier Schemes

| Short URI | Resolvable URI | Description | Example | Code list or format specification |
| --- | --- | --- | --- | --- |
| eu.animalId | | EU-wide animal identification in terms of [ISO 11784](https://www.iso.org/standard/25881.html), where the first three decimal digits represent the [ISO 3166-1 numeric](https://en.wikipedia.org/wiki/ISO_3166-1_numeric) country code. This is a generalised form, actual specifications are set by the Competent Authority in each country. | 276000312312345 | |
| eu.bovine | | EU-wide identification for bovine animals, with an [ISO 3166 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) prefix. This is a generalised form, actual specifications are set by the Competent Authority in each country. | NL 6802 5082 9 | |
| icar.Interbull | | Interbull recognised animal identifiers | | https://wiki.interbull.org/public/File200 |
| nz.digad.birthid | TBC | New Zealand dairy Birth Id | ABCD-21-1234 | |
| nz.nait.visualid | TBC | New Zealand beef and deer visual identifier | 123456-12-1234| |
| std.iso.11785 | | ISO 11785 compliant RFID Code Number, decimal representation with the first 3 digits containing country or manufacturer code. | 276000312312345 | https://www.iso.org/standard/25881.html |
| usa.ain | | United States Animal Identification Number | 840003123456789 or USA0003123456789 | https://www.ecfr.gov/current/title-9/chapter-I/subchapter-C/part-86 |
| us.bovine | | US Lifetime Herdbook number | US 123456789 | |  
| uk.cts.eartag | | UK identification for bovine animals | UK230011200123 | https://www.gov.uk/guidance/get-new-or-replacement-official-ear-tags-for-cattle#ear-tagging-rules https://www.food.gov.uk/sites/default/files/media/document/chapter-2.5-animal-identification.pdf |
| au.nlis | | Australian NLIS animal identification: the visual code printed on tags  | QABC1234XBC2345 | A combination of the original PIC, manufacturer code, device type, and serial number. See https://www.nlis.mla.com.au/NLISDocuments/Device%20numbers%20-%20Cattle%20(Mar%2011).pdf |
| dk.animalnumber | | Danish official animal lifenumber | 1234501234 | See https://en.foedevarestyrelsen.dk/animals/animal-registration-and-traceability | 
| dk.herdbooknumber | | Danish official herdbook number for sires. | 12345 |  |  
| ca.bovine | [Approved animal indicators - Inspection Canada](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian bovines | 124000123456789 | String, numeric range `124000000000001` – `124000299999999` |
| ca.bison | [CFIA - Bison Indicators](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian bison. Shares the `ca.bovine` root but uses distinct number blocks. | 124000301234567 | Number ranges `124000300000000` – `124000304999999`, `124000310000000` – `124000319999999`, `124000500000000` – `124000549999999` |
| ca.ovine | [CFIA - Ovine Indicators](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian ovines | 124000310000000 | Number ranges `124000310000000` – `124000319999999`, `124000500000000` - `124000549999999` |
| ca.porcine | [CFIA - Pig Indicators](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian porcines | 124000410000000 | Number ranges `124000400000000` – `124000499999999` |
| ca.caprine | [CFIA - Caprine Indicators](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian porcines | 124000341000000 | Number ranges `124000340000000` – `124000344999999` |
| ca.lactanet | https://dairytrace.ca/ | ISO11784 compliant identifier per [CFIA - Dairy Cattle Indicators](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | 124000123456789 | See ca.bovine |
| ca.animalnumber | [Approved animal indicators - Inspection Canada](https://inspection.canada.ca/en/animal-health/terrestrial-animals/traceability/indicators) | ISO 11784 compliant RFID range for Candadian bovines. If not available, the registration id is used. | 124000123456789 / reg id (max 12 digits): 0123456789012 | See ca.bovine / If not available, the registration id is used. |
| composite.withinherdid |  |  |  Used where there is no national scheme, but a composite ID is made by combining a herd or location ID with the animal ID, separated by a period. | "123456.2516" | | 
