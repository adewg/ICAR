# Identification Schemes
The ICAR ADE endpoints and messages need to be able to identify objects in many different countries. Because each country or even company may have its own identifiers there is no guarantee that an identifier will be unique. Since there are many different object and different schemes for each object, schemes are used to be able to use them concurrently and guarantee uniqueness.

Using identification schemes gives us the following advantages:
* Making identifiers unique across different countries
* Describing the type of identifier, giving more information about it
* Describe how an identifier can be validated (if possible)
* Prevent requests against sources that do not support a scheme (e.g. sending an identifier with a local France company scheme to the Dutch governmental organization)

# Principles

When do we decide to introduce (publish) a scheme? There are a few criteria to check:

* it has to be a well known identifier (within that sector or region), used by multiple parties to exchange data;
* it has to be unique across all parties using that identifier;
* it has to have a limited set of authoritive source or sources for those identifiers;
* the identifier has to be relatable to a legal entity (who "owns" the asset). 

The registry below is INFORMATIVE (other schemes can be used), but helps establish well-known identifiers.
 
# Identifier Format
We prefer that schemes are human readable even when URL-encoded. This means we prefer that schemes do not contain : or / or other special characters. We recommend the [Reverse Domain Name](https://en.wikipedia.org/wiki/Reverse_domain_name_notation) notation used by Java and Android packages, because it will tend to naturally group schemes from the same organisation or country. For example, "org.icar.id".

# Schemes

## Farms / locations

| id  | name  | example| region & issuing party  | RegEx |
|---|---|---|---|---|
| eu-farm-id  | farm id  |  276031231231234 | EU wide scheme with a country prefix, combining multiple national schemes | |
| de-farm-id  | farm id  | 96123456.001.001  |  Farm ID as issued by VIT. The first section correlates 1:1 with a eu-farm-id while the latter two sections specify the location in more detail. | |
| nl-ubn  | uniek bedrijfsnummer  |   | Used in the Netherlands, used by the government (see [Uniek Bedrijfsnummer on wikipedia](https://nl.wikipedia.org/wiki/Uniek_Bedrijfsnummer). Note: this may be part of the eu-farm-id scheme?  | |
| be-pen  | Productie-eenheidsnummer   |   | Issued by Agentschap voor Landbouw en Visserij (ALV) | |
| au.gov.ag.pic | PIC | NA477352 | Australian farm property identifier code. Issued by each State's department of agriculture. |

## Milk tank id's
| id  | name  | example| region & issuing party  | RegEx | 
|---|---|---|---|---|
| nl-ftn  | milk tank id (fabriekstanknummer)  |  123123456 | Dutch scheme for indicating milk tanks. Issued by dairy factories. First 3 digits indicate factory, last 6 are the tank id. | |


## Animals
These schemes point to a specific animal.

| id  | name  | example| region & issuing party  | RegEx |
|---|---|---|---|---|
| eu-animal-id  | LOM  |  276000312312345 | EU wide scheme with a country prefix, combining multiple national schemes. Is used by transponders. First 3 positions is country code , e.g. 276=DE, is numeric, 15 digits. | |
| nl-v1 (rename to eu-??) | animal life number |NL 6802 *5082* 9 | EU wide scheme with a countryprefix, but different than the one above?  [RVO on levensnummers](http://www.rvo.nl/onderwerpen/agrarisch-ondernemen/dieren/dieren-registreren/runderen/oormerken-voor-runderen) | |

## Legal entities / companies

These schemes point to a legal entity. One that can be authenticated and is authorised to make decisions on assets defined by one of the other schemes.

| id  | name  | example| region & issuing party  | RegEx |
|---|---|---|---|---|
| nl-kvk | Chamber of commerce number (Kamer van Koophandel nummer) |64039641 | Used in the Netherlands. Issued by the 'Kamer van Koophandel', can be checked at e.g. [OpenKVK](www.openkvk.nl) | |
| be-onn | Chamber of commerce number (Ondernemersnummer) | | Used in Belgium. Issued by the 'Kruispuntbank voor Ondernemingen', can be checked at e.g. [fgov](https://kbopub.economie.fgov.be/kbopub/zoeknummerform.html?lang=nl) | |

