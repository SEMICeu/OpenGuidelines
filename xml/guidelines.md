# Introduction

The Core Vocabularies are semantic agreements. The semantics are expressed in human readable format, but also in machine readable formats. The Core Vocabularies use Semantic Web technology for the latter.  Besides historical reasons, it can be considered as a lightweight formalization of the semantics, as it is able to connect concrete representation with the human readable interpretation due the fact that the identifiers are dereferenceable. 

Considering software development and building digitals systems, there are two syntactic data representation communities that dominate the software design: XML and JSON.  Besides these many other representation forms exist: often (binary) formats designed for a dedicated ecosystems. 

Despite JSON is a recent data representation format, it is nowadays the prime data representation format, especially for anything that has to do with UI’s, and via that way it has penetrated in backend systems for sharing data.  The Semantic Web community and the JSON representation community has created with JSON-LD a (W3C) standard approach to connect both ecosystems to the benefit of both (in practice RDF can be serialized as JSON by adding semantics). By standardizing a mapping language and mapping processor semantics can be attached to JSON structures. 

For XML such integration is not existing despite the design of the Semantic Web  representation has been inspired by XML. Because XML exists for already 5 decades (and even longer if one take into account its ancestor SGML) it is natural that communities have established their specific guidelines and best practices in order to facilitate the processing of XML.  

This document documents the approach on how in a generic coherent way an XML representation can be generated for the Core Vocabularies. It will motivate the design rules applied in this process.  

**NOTE** It must be noted that these XML representations might not be out-of-the box for a specific XML community, as they do not conform to the specific guidelines of that XML community. In that case they can be inspirational and lower the barriers for reuse of the Core Vocabulary in that XML community.

**NOTE** This document is a living document. It will change over time while applying the rules in practice in the generation process. This allows to document the reasoning and motivation behind decisions.

## Guidelines
This section highlights the principles and the rules under which the Core Vocabularies will be implemented as XML schema.

## Principles
In the below table there are main principles of the Core Vocabularies XML schema, some of them are derived from existing NDR, not necessary implemented in the same way.

| PR# | Title | Implementation | Sources |
| --- | ----- | -------------- | ------- |
| PR1 | Internet Use | Core Vocabularies will be accessed via Persistent URI, privileging resolvability over naming. Thus namespace location will provide hints where XML schemas will be found. | UBL, NIEM, |
| Note: UBL uses URN for namespaces |
| PR2 | Legibility | Core Vocabularies will be documented in HTML, definitions will be following rules to be reasonably clear. | UBL, NIEM |
| PR3 | Simplicity | Core Vocabularies will be kept simple to accommodate customization, the specification SHOULD specify what is necessary for semantic interoperability and no more. | UBL, NIEM |
| PR4 | Component Reuse | Core Vocabularies will be structured in order to maximize their reuse. Core Vocabularies schemas SHOULD NOT use or define local or anonymous components, as they adversely affect reuse. | UBL,NIEM |
| PR5 | Easy Customization and Maintenance | Core Vocabularies schemas SHOULD be designed to enable extensions. |
| The design process will be automated as much as possible to easy maintenance. | UBL, NIEM |
| PR6 | Relationship to Other Namespaces  | Core Vocabularies schemas design will be cautious about making dependencies on other namespaces. | UBL |
| PR7 | Adoption of open standards | Core Vocabularies schemas SHOULD leverage and enable use of other open standards. | NIEM |
| PR8 | W3C XML Schema language | All Core Vocabularies design rules are based on the W3C XML Schema, so that instances can be validated against | UBL, NIEM |
| PR9 | Using separated rules | Using separate rules allows specific conditions to be clearly stated. | NIEM |
| PR10 | Naming consistency | Components in Core Vocabularies SHOULD be given names that are consistent with names of other Core Vocabularies components. Such names SHOULD be based on simple rules. | NIEM |
| PR11 | Be Consistent | Component definitions in Core Vocabularies schemas SHOULD have semantic consistency. | NIEM |
| PR12 | Reserve inheritance for specialization | Complex type definitions in Core Vocabularies schemas SHOULD use type inheritance only for specialization. | NIEM |
| PR13 | Be mindful of namespace cohesion | XML namespaces defined by Core Vocabularies schemas SHOULD encapsulate data components that are coherent, consistent, and internally related as a set. A namespace SHOULD encapsulate components that tend to change together. | NIEM |

<table>
<tr>
<td> R# </td> <td> Description </td>
</tr>
<tr><td> R1 </td><td> Core Vocabularies schema MUST conform to the following physical layout as applicable: 

```
<!-- ======= XML Declaration======== →
<!-- ===== XML schema Element With Namespaces Declarations and Annotation===== -->
<!-- ===== Imports ===== →
<!-- ===== Element Declarations ===== -->
alphabetized order
<!-- ===== Type Definitions ===== →
alphabetized order
``` 
</td></tr>
<tr><td> R2 </td><td> XML schema element declaration MUST be:

```
<?xml version="1.0" encoding="UTF-8"?>
```

</td></tr>
<tr><td> R3 </td><td> The XML document MUST BE a xs:schema
</td></tr>
<tr><td> R4 </td><td> The xs:schema must have a data definition, in order to describe Core Vocabularies.

Example:
```
<xsd:schema xmlns="http://data.europa.eu/m8g/"
            xmlns:dct="http://purl.org/dc/terms/"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            targetNamespace="http://data.europa.eu/m8g/"
            elementFormDefault="qualified"
            attributeFormDefault="unqualified"
            xml:lang="en"
            version="2.0">
    <xsd:annotation>
        <xsd:documentation xml:lang="en">Core Vocabularies</xsd:documentation>
      <xsd:appinfo>
            <dct:abstract>Core Vocabularies are simplified, reusable, and extensible data models that capture the fundamental characteristics of an entity, such as a person or a public organisation, in a context-neutral manner.</dct:abstract>
            <dct:issued>2021-06-30</dct:issued>
            <dct:publisher>http://publications.europa.eu/resource/authority/corporate-body/DIGIT</dct:publisher>
            <dct:license>https://creativecommons.org/licenses/by/4.0/</dct:license>
        </xsd:appinfo>
    </xsd:annotation>
```
</td></tr>
<tr><td> R5 </td><td> The xs:schema must have a Target Namespace, see example in R4 </td></tr>
<tr><td> R6 </td><td> The Target Namespace MUST be an absolute URI, see example in R4 </td></tr>
<tr><td> R7 </td><td> The Target Namespace MUST never be changed </td></tr>
<tr><td> R8 </td><td> The xs:schema MUST have a version, see example in R4 </td></tr>
<tr><td> R9 </td><td> The xs:schema MUST have elementFormDefault=qualified, see example in R4 </td></tr>
<tr><td> R10 </td><td> The xs:schema MAY have attributeFormDefault=unqualified (default value), see example in R4 </td></tr>
<tr><td> R11 </td><td> Core Vocabularies schema MAY be split into multiple schema modules </td></tr>
<tr><td> R12 </td><td> xs:import must have a namespace </td></tr>
<tr><td> R13 </td><td> Each xsd:schemaLocation attribute declaration MUST contain a system-resolvable URL </td></tr>
<tr><td> R14 </td><td> Comment is not recommended </td></tr>
<tr><td> R15 </td><td> Documentation element has no element children </td></tr>
<tr><td> R16 </td><td> xs:documentation has xml:lang, see example in R4 </td></tr>
<tr><td> R17 </td><td> Built-in XSD Simple Types SHOULD be used wherever possible </td></tr>
<tr><td> R18 </td><td> All W3C XML Schema constructs in Core Vocabularies schema MUST contain the following namespace declaration on the xs schema element: 

```
          xmlns:xs="http://www.w3.org/2001/XMLSchema"
```
See example in R4
</td></tr>
<tr><td> R19 </td><td> xs:appinfo children are comments, elements, or whitespace, see example in R4 </td></tr>
<tr><td> R20 </td><td> Appinfo child elements have namespaces, see example in R4 </td></tr>
<tr><td> R21 </td><td> Appinfo descendants are not XML Schema elements </td></tr>
<tr><td> R22 </td><td> Core Vocabularies XML element and type names MUST be in the English language, using the primary English spellings provided in the Oxford English Dictionary, except for those concept that imported from other vocabularies </td></tr>
<tr><td> R23 </td><td> Core Vocabularies XML element, and simple and complex type names MUST NOT use acronyms, abbreviations, or other word truncations, except those in the list of exceptions maintained and published by SEMIC team </td></tr>
<tr><td> R24 </td><td> Acronyms and abbreviations MUST appear in all upper case for all element declarations and type definitions </td></tr>
<tr><td> R25 </td><td> Core Vocabularies XML element, and type names MUST be in singular form unless the concept itself is plural. </td></tr>

</table> 
 
