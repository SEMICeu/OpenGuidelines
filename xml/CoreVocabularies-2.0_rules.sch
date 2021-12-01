<?xml version="1.0" encoding="US-ASCII" standalone="yes"?><sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2">
      <sch:title>Rules for reference XML Schema documents</sch:title>
        
	<sch:ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
	<sch:ns prefix="xsl" uri="http://www.w3.org/1999/XSL/Transform"/>
	<sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
                 
	<sch:pattern id="rule_3"><sch:title>Document element is xs:schema</sch:title>
	  <sch:rule context="/">
	    <sch:assert test="xs:schema">Rule 3: The [document element] of the [XML document] MUST have the name xs:schema.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_4"><sch:title>Schema has data definition</sch:title>
	  <sch:rule context="xs:schema">
	    <sch:assert test="some $definition in (xs:annotation/xs:documentation)[1] satisfies string-length(normalize-space(string($definition))) &gt; 0">Rule 4: An element xs:schema MUST have a data definition.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_5"><sch:title>Schema document defines target namespace</sch:title>
	  <sch:rule context="xs:schema">
	    <sch:assert test="exists(@targetNamespace)">Rule 5: The schema MUST define a target namespace.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_8"><sch:title>Schema has version</sch:title>
	  <sch:rule context="xs:schema">
	    <sch:assert test="some $version in @version satisfies string-length(normalize-space(@version)) &gt; 0">Rule 8: An element xs:schema MUST have an attribute {}version that MUST NOT be empty.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_12"><sch:title>xs:import must have namespace</sch:title>
	  <sch:rule context="xs:import">
	    <sch:assert test="exists(@namespace)">Rule 12: An element xs:import MUST have an attribute {}namespace.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_14"><sch:title>Comment is not recommended</sch:title>
	  <sch:rule context="node()[comment()]">
	    <sch:report test="true()" role="warning">Rule 14: An XML Comment is not an XML Schema annotation component; an XML comment SHOULD NOT appear in the schema.</sch:report>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_15"><sch:title>Documentation element has no element children</sch:title>
	  <sch:rule context="xs:documentation/node()">
	    <sch:assert test="self::text() or self::comment()">Rule 15: A child of element xs:documentation MUST be text or an XML comment.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_16"><sch:title>xs:documentation has xml:lang</sch:title>
	  <sch:rule context="xs:documentation">
	    <sch:let name="xml-lang-attribute" value="ancestor-or-self::*[exists(@xml:lang)][1]/@xml:lang"/>
	    <sch:assert test="exists($xml-lang-attribute) and string-length(normalize-space($xml-lang-attribute)) gt 0">Rule 16: An occurrence of xs:documentation within the schema MUST be in the scope of an occurrence of attribute xml:lang that has a value that is not empty.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_19"><sch:title>xs:appinfo children are comments, elements, or whitespace</sch:title>
	  <sch:rule context="xs:appinfo/node()">
	    <sch:assert test="self::comment() or self::element() or self::text()[string-length(normalize-space(.)) = 0]">Rule 19: A child of element xs:appinfo MUST be an element, a comment, or whitespace text.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_20"><sch:title>Appinfo child elements have namespaces</sch:title>
	  <sch:rule context="xs:appinfo/*">
	    <sch:assert test="namespace-uri() != xs:anyURI('')">Rule 20: An element that is a child of xs:appinfo MUST have a namespace name.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_21"><sch:title>Appinfo descendants are not XML Schema elements</sch:title>
	  <sch:rule context="xs:appinfo//xs:*">
	    <sch:assert test="false()">Rule 21: An element with a namespace name of xs: MUST NOT have an ancestor element xs:appinfo.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_26"><sch:title>Name of schema component other than attribute begins with upper case letter</sch:title>
	  <sch:rule context="xs:attribute">
	    <sch:report test="false()" role="warning">Rule 26: This rule does not apply to an attribute.</sch:report>
	  </sch:rule>
	  <sch:rule context="xs:*[exists(@name)]">
	    <sch:assert test="matches(@name, '^[A-Z]')">Rule 26: Within the schema, an XML Schema component that is not an attribute declaration MUST have a name that begins with an upper-case letter ('A'-'Z').</sch:assert>
	  </sch:rule>
	</sch:pattern>
	          
	<sch:pattern id="rule_30"><sch:title>Element declaration is top-level</sch:title>
	  <sch:rule context="xs:element[exists(@name)]">
	    <sch:assert test="exists(parent::xs:schema)">Rule 30: An element declaration MUST be top-level.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_31"><sch:title>Complex type definition is top-level</sch:title>
	  <sch:rule context="xs:complexType">
	    <sch:assert test="exists(parent::xs:schema)">Rule 31: A complex type definition MUST be top-level.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_32"><sch:title>Element declaration has data definition</sch:title>
	  <sch:rule context="xs:element[exists(@name)]">
	    <sch:assert test="some $definition in xs:annotation/xs:documentation[1] satisfies string-length(normalize-space(string($definition))) &gt; 0">Rule 32: An element declaration MUST have a data definition.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_33"><sch:title>Complex type has data definition</sch:title>
	  <sch:rule context="xs:complexType">
	    <sch:assert test="some $definition in xs:annotation/xs:documentation[1] satisfies string-length(normalize-space(string($definition))) &gt; 0">Rule 33: A complex type MUST have a data definition.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_35"><sch:title>Name of type ends in "Type"</sch:title>
	  <sch:rule context="xs:*[(self::xs:simpleType or self::xs:complexType) and exists(@name)]">
	    <sch:assert test="ends-with(@name, 'Type')">Rule 35: A type definition schema component MUST have a name that ends in "Type".</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_36"><sch:title>Only types have name ending in "Type" or "SimpleType"</sch:title>
	  <sch:rule context="xs:*[exists(@name) and ends-with(@name, 'SimpleType')]">
	    <sch:assert test="local-name() = 'simpleType'">Rule 36: A schema component with a name that ends in 'SimpleType' MUST be a simple type definition.</sch:assert>
	  </sch:rule>
	  <sch:rule context="xs:*[exists(@name) and ends-with(@name, 'Type')]">
	    <sch:assert test="local-name() = 'complexType'">Rule 36: A schema component with a name that ends in 'Type' and does not end in 'SimpleType' MUST be a complex type definition.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_37"><sch:title>No base type of xs:anyType</sch:title>
	  <sch:rule context="xs:*[exists(@base)]">
	    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:anyType')">Rule 37: A schema component MUST NOT have an attribute {}base with a value of xs:anyType.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_38"><sch:title>No base type of xs:NOTATION</sch:title>
	  <sch:rule context="xs:*[exists(@base)]">
	    <sch:assert test="resolve-QName(@base, .) != xs:QName('xs:NOTATION')">Rule 38: A schema component MUST NOT have an attribute {}base with a value of xs:NOTATION.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_39"><sch:title>No xs:all</sch:title>
	  <sch:rule context="xs:all">
	    <sch:assert test="false()">Rule 39: The schema MUST NOT contain the element xs:all</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_40"><sch:title>No use of xs:anyAttribute</sch:title>
	  <sch:rule context="xs:anyAttribute">
	    <sch:assert test="false()">Rule 40: The schema MUST NOT contain the element xs:anyAttribute.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_41"><sch:title>No use of xs:any</sch:title>
	  <sch:rule context="xs:any">
	    <sch:assert test="false()">Rule 41: The schema MUST NOT contain the element xs:any.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_42"><sch:title>No xs:choice</sch:title>
	  <sch:rule context="xs:choice">
	    <sch:assert test="false()">Rule 42: The schema MUST NOT contain the element xs:choice</sch:assert>
	  </sch:rule>
	</sch:pattern>
	
	<sch:pattern id="rule_43"><sch:title>No mixed content on complex type</sch:title>
	  <sch:rule context="xs:complexType[exists(@mixed)]">
	    <sch:assert test="xs:boolean(@mixed) = false()">Rule 43: A complex type definition MUST NOT have mixed content.</sch:assert>
	  </sch:rule>
	</sch:pattern>
		
	<sch:pattern id="rule_45"><sch:title>xs:sequence must be child of xs:extension</sch:title>
	  <sch:rule context="xsd:complexContent/xs:extension">
	    <sch:assert test="xs:sequence">Rule 45: An element xs:sequence MUST be a child of element xs:extension of ComplexContext.</sch:assert>
	  </sch:rule>
	  	  <sch:rule context="xsd:simpleContent/xs:extension/xs:sequence">
	    <sch:assert test="false()">Rule 45: An element xs:sequence MUST not be a child of element xs:extension of SimpleContent.</sch:assert>
	  </sch:rule>
	</sch:pattern>
		
	<sch:pattern id="rule_46"><sch:title>Sequence has minimum cardinality 1</sch:title>
	  <sch:rule context="xs:sequence">
	    <sch:assert test="empty(@minOccurs) or xs:integer(@minOccurs) = 1">Rule 46: An element xs:sequence MUST either not have the attribute {}minOccurs, or that attribute MUST have a value of 1.</sch:assert>
	  </sch:rule>
	</sch:pattern>
	              
	<sch:pattern id="rule_47"><sch:title>Sequence has maximum cardinality 1</sch:title>
	  <sch:rule context="xs:sequence">
	    <sch:assert test="empty(@maxOccurs) or (@maxOccurs instance of xs:integer and 1 = xs:integer(@maxOccurs))">Rule 47: An element xs:sequence MUST either not have the attribute {}maxOccurs, or that attribute MUST have a value of 1.</sch:assert>
	  </sch:rule>
	</sch:pattern>
 
</sch:schema> 