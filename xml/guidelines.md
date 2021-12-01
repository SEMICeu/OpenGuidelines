Introduction

The Core Vocabularies are semantic agreements. The semantics are expressed in human readable format, but also in machine readable formats. The Core Vocabularies use Semantic Web technology for the latter.  Besides historical reasons, it can be considered as a lightweight formalization of the semantics, as it is able to connect concrete representation with the human readable interpretation due the fact that the identifiers are dereferenceable. 

Considering software development and building digitals systems, there are two syntactic data representation communities that dominate the software design: XML and JSON.  Besides these many other representation forms exist: often (binary) formats designed for a dedicated ecosystems. 

Despite JSON is a recent data representation format, it is nowadays the prime data representation format, especially for anything that has to do with UI’s, and via that way it has penetrated in backend systems for sharing data.  The Semantic Web community and the JSON representation community has created with JSON-LD a (W3C) standard approach to connect both ecosystems to the benefit of both (in practice RDF can be serialized as JSON by adding semantics). By standardizing a mapping language and mapping processor semantics can be attached to JSON structures. 

For XML such integration is not existing despite the design of the Semantic Web  representation has been inspired by XML. Because XML exists for already 5 decades (and even longer if one take into account its ancestor SGML) it is natural that communities have established their specific guidelines and best practices in order to facilitate the processing of XML.  

This document documents the approach on how in a generic coherent way an XML representation can be generated for the Core Vocabularies. It will motivate the design rules applied in this process.  

NOTE It must be noted that these XML representations might not be out-of-the box for a specific XML community, as they do not conform to the specific guidelines of that XML community. In that case they can be inspirational and lower the barriers for reuse of the Core Vocabulary in that XML community.

NOTE This document is a living document. It will change over time while applying the rules in practice in the generation process. This allows to document the reasoning and motivation behind decisions.

Guidelines
This section highlights the principles and the rules under which the Core Vocabularies will be implemented as XML schema.

Principles
In the below table there are main principles of the Core Vocabularies XML schema, some of them are derived from existing NDR, not necessary implemented in the same way.

