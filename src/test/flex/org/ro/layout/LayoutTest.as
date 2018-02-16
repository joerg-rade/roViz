package org.ro.layout {

import org.flexunit.Assert;

public class LayoutTest {
    public function LayoutTest() {
    }

    [Test(description="parse result of invoking url")]
    public function testObjectLayout():void {
        //when
        var lo:Layout = new Layout(json);
        // then
        var properties:Vector.<PropertyLayout> = lo.getProperties();
        Assert.assertEquals(2, properties.length);
        Assert.assertEquals("name", properties[0].getId());
        Assert.assertEquals("notes", properties[1].getId());
    }

    [Test(description="parse result of invoking url")]
    public function testFixtureScriptObjectLayout():void {
        //when
        var lo:Layout = new Layout(json2);
        // then
        var properties:Vector.<PropertyLayout> = lo.getProperties();
        Assert.assertEquals(4, properties.length);
        Assert.assertEquals("className", properties[0].getId());
        Assert.assertEquals("fixtureScriptClassName", properties[1].getId());
        Assert.assertEquals("key", properties[2].getId());
        Assert.assertEquals("object", properties[3].getId());
    }

    // http://localhost:8080/restful/objects/simple.SimpleObject/0/object-layout
    private var json:Object = {
        "row": [
            {
                "cols": [
                    {
                        "col": {
                            "domainObject": {
                                "named": null,
                                "describedAs": null,
                                "plural": null,
                                "metadataError": null,
                                "link": {
                                    "rel": "urn:org.restfulobjects:rels/element",
                                    "method": "GET",
                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0",
                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\""
                                },
                                "bookmarking": "AS_ROOT",
                                "cssClass": null,
                                "cssClassFa": null,
                                "cssClassFaPosition": null,
                                "namedEscaped": null
                            },
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 12,
                            "unreferencedActions": true,
                            "unreferencedCollections": null
                        }
                    }
                ],
                "metadataError": null,
                "cssClass": null,
                "id": null
            },
            {
                "cols": [
                    {
                        "col": {
                            "domainObject": null,
                            "tabGroup": [
                                {
                                    "tab": [
                                        {
                                            "name": "General",
                                            "row": [
                                                {
                                                    "cols": [
                                                        {
                                                            "col": {
                                                                "domainObject": null,
                                                                "fieldSet": [
                                                                    {
                                                                        "name": "Name",
                                                                        "action": [
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": "Deletes this object from the persistent datastore",
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/action",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/delete",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                                                                },
                                                                                "id": "delete",
                                                                                "bookmarking": null,
                                                                                "cssClass": null,
                                                                                "cssClassFa": null,
                                                                                "cssClassFaPosition": null,
                                                                                "hidden": null,
                                                                                "namedEscaped": null,
                                                                                "position": "PANEL",
                                                                                "promptStyle": null
                                                                            }
                                                                        ],
                                                                        "property": [
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": null,
                                                                                "action": [
                                                                                    {
                                                                                        "named": null,
                                                                                        "describedAs": "Updates the object's name",
                                                                                        "metadataError": null,
                                                                                        "link": {
                                                                                            "rel": "urn:org.restfulobjects:rels/action",
                                                                                            "method": "GET",
                                                                                            "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/updateName",
                                                                                            "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                                                                        },
                                                                                        "id": "updateName",
                                                                                        "bookmarking": null,
                                                                                        "cssClass": null,
                                                                                        "cssClassFa": null,
                                                                                        "cssClassFaPosition": null,
                                                                                        "hidden": null,
                                                                                        "namedEscaped": null,
                                                                                        "position": "BELOW",
                                                                                        "promptStyle": null
                                                                                    }
                                                                                ],
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/property",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/name",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                                                                },
                                                                                "id": "name",
                                                                                "cssClass": null,
                                                                                "hidden": null,
                                                                                "labelPosition": null,
                                                                                "multiLine": null,
                                                                                "namedEscaped": true,
                                                                                "promptStyle": null,
                                                                                "renderedAsDayBefore": null,
                                                                                "typicalLength": null,
                                                                                "unchanging": null
                                                                            },
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": null,
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/property",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/notes",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                                                                },
                                                                                "id": "notes",
                                                                                "cssClass": null,
                                                                                "hidden": "ALL_TABLES",
                                                                                "labelPosition": null,
                                                                                "multiLine": 10,
                                                                                "namedEscaped": true,
                                                                                "promptStyle": null,
                                                                                "renderedAsDayBefore": null,
                                                                                "typicalLength": null,
                                                                                "unchanging": null
                                                                            }
                                                                        ],
                                                                        "metadataError": null,
                                                                        "id": "name",
                                                                        "unreferencedActions": null,
                                                                        "unreferencedProperties": null
                                                                    }
                                                                ],
                                                                "metadataError": null,
                                                                "cssClass": null,
                                                                "size": null,
                                                                "id": null,
                                                                "span": 12,
                                                                "unreferencedActions": null,
                                                                "unreferencedCollections": null
                                                            }
                                                        }
                                                    ],
                                                    "metadataError": null,
                                                    "cssClass": null,
                                                    "id": null
                                                }
                                            ],
                                            "cssClass": null
                                        },
                                        {
                                            "name": "Metadata",
                                            "row": [
                                                {
                                                    "cols": [
                                                        {
                                                            "col": {
                                                                "domainObject": null,
                                                                "fieldSet": [
                                                                    {
                                                                        "name": "Metadata",
                                                                        "property": [
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": null,
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/property",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/datanucleusIdLong",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                                                                },
                                                                                "id": "datanucleusIdLong",
                                                                                "cssClass": null,
                                                                                "hidden": null,
                                                                                "labelPosition": null,
                                                                                "multiLine": null,
                                                                                "namedEscaped": null,
                                                                                "promptStyle": null,
                                                                                "renderedAsDayBefore": null,
                                                                                "typicalLength": null,
                                                                                "unchanging": null
                                                                            },
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": null,
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/property",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/datanucleusVersionLong",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                                                                },
                                                                                "id": "datanucleusVersionLong",
                                                                                "cssClass": null,
                                                                                "hidden": null,
                                                                                "labelPosition": null,
                                                                                "multiLine": null,
                                                                                "namedEscaped": null,
                                                                                "promptStyle": null,
                                                                                "renderedAsDayBefore": null,
                                                                                "typicalLength": null,
                                                                                "unchanging": null
                                                                            },
                                                                            {
                                                                                "named": null,
                                                                                "describedAs": null,
                                                                                "metadataError": null,
                                                                                "link": {
                                                                                    "rel": "urn:org.restfulobjects:rels/property",
                                                                                    "method": "GET",
                                                                                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/datanucleusVersionTimestamp",
                                                                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                                                                },
                                                                                "id": "datanucleusVersionTimestamp",
                                                                                "cssClass": null,
                                                                                "hidden": null,
                                                                                "labelPosition": null,
                                                                                "multiLine": null,
                                                                                "namedEscaped": null,
                                                                                "promptStyle": null,
                                                                                "renderedAsDayBefore": null,
                                                                                "typicalLength": null,
                                                                                "unchanging": null
                                                                            }
                                                                        ],
                                                                        "metadataError": null,
                                                                        "id": "metadata",
                                                                        "unreferencedActions": null,
                                                                        "unreferencedProperties": null
                                                                    }
                                                                ],
                                                                "metadataError": null,
                                                                "cssClass": null,
                                                                "size": null,
                                                                "id": null,
                                                                "span": 12,
                                                                "unreferencedActions": null,
                                                                "unreferencedCollections": null
                                                            }
                                                        }
                                                    ],
                                                    "metadataError": null,
                                                    "cssClass": null,
                                                    "id": null
                                                }
                                            ],
                                            "cssClass": null
                                        },
                                        {
                                            "name": "Other",
                                            "row": [
                                                {
                                                    "cols": [
                                                        {
                                                            "col": {
                                                                "domainObject": null,
                                                                "fieldSet": [
                                                                    {
                                                                        "name": "Other",
                                                                        "metadataError": null,
                                                                        "id": "other",
                                                                        "unreferencedActions": null,
                                                                        "unreferencedProperties": true
                                                                    }
                                                                ],
                                                                "metadataError": null,
                                                                "cssClass": null,
                                                                "size": null,
                                                                "id": null,
                                                                "span": 12,
                                                                "unreferencedActions": null,
                                                                "unreferencedCollections": null
                                                            }
                                                        }
                                                    ],
                                                    "metadataError": null,
                                                    "cssClass": null,
                                                    "id": null
                                                }
                                            ],
                                            "cssClass": null
                                        }
                                    ],
                                    "metadataError": null,
                                    "cssClass": null,
                                    "unreferencedCollections": null
                                },
                                {
                                    "metadataError": null,
                                    "cssClass": null,
                                    "unreferencedCollections": null
                                }
                            ],
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 6,
                            "unreferencedActions": null,
                            "unreferencedCollections": null
                        }
                    },
                    {
                        "col": {
                            "domainObject": null,
                            "tabGroup": [
                                {
                                    "metadataError": null,
                                    "cssClass": null,
                                    "unreferencedCollections": true
                                }
                            ],
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 6,
                            "unreferencedActions": null,
                            "unreferencedCollections": null
                        }
                    }
                ],
                "metadataError": null,
                "cssClass": null,
                "id": null
            }
        ],
        "cssClass": null
    }

    // http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/object-layout
    private var json2:Object = {
        "row": [
            {
                "cols": [
                    {
                        "col": {
                            "domainObject": {
                                "named": null,
                                "describedAs": null,
                                "plural": null,
                                "metadataError": null,
                                "link": {
                                    "rel": "urn:org.restfulobjects:rels/element",
                                    "method": "GET",
                                    "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
                                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\""
                                },
                                "bookmarking": null,
                                "cssClass": null,
                                "cssClassFa": null,
                                "cssClassFaPosition": null,
                                "namedEscaped": null
                            },
                            "action": [
                                {
                                    "named": null,
                                    "describedAs": null,
                                    "metadataError": null,
                                    "link": {
                                        "rel": "urn:org.restfulobjects:rels/action",
                                        "method": "GET",
                                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/clearHints",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "clearHints",
                                    "bookmarking": null,
                                    "cssClass": null,
                                    "cssClassFa": null,
                                    "cssClassFaPosition": null,
                                    "hidden": null,
                                    "namedEscaped": null,
                                    "position": null,
                                    "promptStyle": null
                                },
                                {
                                    "named": null,
                                    "describedAs": null,
                                    "metadataError": null,
                                    "link": {
                                        "rel": "urn:org.restfulobjects:rels/action",
                                        "method": "GET",
                                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/downloadLayoutXml",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "downloadLayoutXml",
                                    "bookmarking": null,
                                    "cssClass": null,
                                    "cssClassFa": null,
                                    "cssClassFaPosition": null,
                                    "hidden": null,
                                    "namedEscaped": null,
                                    "position": null,
                                    "promptStyle": null
                                },
                                {
                                    "named": null,
                                    "describedAs": null,
                                    "metadataError": null,
                                    "link": {
                                        "rel": "urn:org.restfulobjects:rels/action",
                                        "method": "GET",
                                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/rebuildMetamodel",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "rebuildMetamodel",
                                    "bookmarking": null,
                                    "cssClass": null,
                                    "cssClassFa": null,
                                    "cssClassFaPosition": null,
                                    "hidden": null,
                                    "namedEscaped": null,
                                    "position": null,
                                    "promptStyle": null
                                },
                                {
                                    "named": null,
                                    "describedAs": null,
                                    "metadataError": null,
                                    "link": {
                                        "rel": "urn:org.restfulobjects:rels/action",
                                        "method": "GET",
                                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/openRestApi",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "openRestApi",
                                    "bookmarking": null,
                                    "cssClass": null,
                                    "cssClassFa": null,
                                    "cssClassFaPosition": null,
                                    "hidden": null,
                                    "namedEscaped": null,
                                    "position": null,
                                    "promptStyle": null
                                }
                            ],
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 12,
                            "unreferencedActions": true,
                            "unreferencedCollections": null
                        }
                    }
                ],
                "metadataError": null,
                "cssClass": null,
                "id": null
            },
            {
                "cols": [
                    {
                        "col": {
                            "domainObject": null,
                            "fieldSet": [
                                {
                                    "name": "General",
                                    "property": [
                                        {
                                            "named": null,
                                            "describedAs": null,
                                            "metadataError": null,
                                            "link": {
                                                "rel": "urn:org.restfulobjects:rels/property",
                                                "method": "GET",
                                                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/className",
                                                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                            },
                                            "id": "className",
                                            "cssClass": null,
                                            "hidden": null,
                                            "labelPosition": null,
                                            "multiLine": null,
                                            "namedEscaped": null,
                                            "promptStyle": null,
                                            "renderedAsDayBefore": null,
                                            "typicalLength": null,
                                            "unchanging": null
                                        },
                                        {
                                            "named": null,
                                            "describedAs": null,
                                            "metadataError": null,
                                            "link": {
                                                "rel": "urn:org.restfulobjects:rels/property",
                                                "method": "GET",
                                                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/fixtureScriptClassName",
                                                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                            },
                                            "id": "fixtureScriptClassName",
                                            "cssClass": null,
                                            "hidden": null,
                                            "labelPosition": null,
                                            "multiLine": null,
                                            "namedEscaped": null,
                                            "promptStyle": null,
                                            "renderedAsDayBefore": null,
                                            "typicalLength": null,
                                            "unchanging": null
                                        },
                                        {
                                            "named": null,
                                            "describedAs": null,
                                            "metadataError": null,
                                            "link": {
                                                "rel": "urn:org.restfulobjects:rels/property",
                                                "method": "GET",
                                                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/key",
                                                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                            },
                                            "id": "key",
                                            "cssClass": null,
                                            "hidden": null,
                                            "labelPosition": null,
                                            "multiLine": null,
                                            "namedEscaped": null,
                                            "promptStyle": null,
                                            "renderedAsDayBefore": null,
                                            "typicalLength": null,
                                            "unchanging": null
                                        },
                                        {
                                            "named": null,
                                            "describedAs": null,
                                            "metadataError": null,
                                            "link": {
                                                "rel": "urn:org.restfulobjects:rels/property",
                                                "method": "GET",
                                                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/object",
                                                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                                            },
                                            "id": "object",
                                            "cssClass": null,
                                            "hidden": null,
                                            "labelPosition": null,
                                            "multiLine": null,
                                            "namedEscaped": null,
                                            "promptStyle": null,
                                            "renderedAsDayBefore": null,
                                            "typicalLength": null,
                                            "unchanging": null
                                        }
                                    ],
                                    "metadataError": null,
                                    "id": "general",
                                    "unreferencedActions": null,
                                    "unreferencedProperties": true
                                }
                            ],
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 4,
                            "unreferencedActions": null,
                            "unreferencedCollections": null
                        }
                    },
                    {
                        "col": {
                            "domainObject": null,
                            "metadataError": null,
                            "cssClass": null,
                            "size": null,
                            "id": null,
                            "span": 8,
                            "unreferencedActions": null,
                            "unreferencedCollections": true
                        }
                    }
                ],
                "metadataError": null,
                "cssClass": null,
                "id": null
            }
        ],
        "cssClass": null

    };
    
}
}
