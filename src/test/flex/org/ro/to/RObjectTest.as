package org.ro.to {

import org.flexunit.Assert;

public class RObjectTest {
    public function RObjectTest() {
    }

    [Test(description="parse result of invoking object url")]
    public function testParse():void {
        var ro:RObject = new RObject(json);
        Assert.assertNotNull(ro);
        Assert.assertNotNull(ro.getLayoutLink());
    }

    // http://localhost:8080/restful/objects/simple.SimpleObject/0
    private var json:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Foo"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObject",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/object-layout",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/object-layout",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Foo"
            },
            {
                "rel": "urn:org.restfulobjects:rels/update",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0",
                "method": "PUT",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "arguments": {}
            }
        ],
        "extensions": {
            "oid": "simple.SimpleObject:0",
            "isService": false,
            "isPersistent": true
        },
        "title": "Object: Foo",
        "domainType": "simple.SimpleObject",
        "instanceId": "0",
        "members": {
            "name": {
                "id": "name",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"name\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/name",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": "Foo",
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Immutable"
            },
            "notes": {
                "id": "notes",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"notes\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/notes",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": null,
                "extensions": {
                    "x-isis-format": "string"
                }
            },
            "datanucleusIdLong": {
                "id": "datanucleusIdLong",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"datanucleusIdLong\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/datanucleusIdLong",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": 0,
                "format": "int",
                "extensions": {
                    "x-isis-format": "long"
                },
                "disabledReason": "Contributed property"
            },
            "datanucleusVersionTimestamp": {
                "id": "datanucleusVersionTimestamp",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"datanucleusVersionTimestamp\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/properties/datanucleusVersionTimestamp",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": 1518074491759,
                "format": "utc-millisec",
                "extensions": {
                    "x-isis-format": "javasqltimestamp"
                },
                "disabledReason": "Contributed property"
            },
            "downloadJdoMetadata": {
                "id": "downloadJdoMetadata",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"downloadJdoMetadata\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/downloadJdoMetadata",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "rebuildMetamodel": {
                "id": "rebuildMetamodel",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"rebuildMetamodel\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/rebuildMetamodel",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "openRestApi": {
                "id": "openRestApi",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"openRestApi\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/openRestApi",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "downloadLayoutXml": {
                "id": "downloadLayoutXml",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"downloadLayoutXml\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/downloadLayoutXml",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "delete": {
                "id": "delete",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"delete\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/delete",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "updateName": {
                "id": "updateName",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"updateName\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/updateName",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "clearHints": {
                "id": "clearHints",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"clearHints\"",
                        "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0/actions/clearHints",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }
    };

}
}
