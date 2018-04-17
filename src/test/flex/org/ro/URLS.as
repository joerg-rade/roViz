package org.ro {
public class URLS {

    public static const RESTFUL_SERVICES:Object = {
        "value": [
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"simple.SimpleObjectMenu\"",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Simple Objects"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.FixtureScriptsDefault\"",
                "href": "http://localhost:8080/restful/services/isisApplib.FixtureScriptsDefault",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.LayoutServiceMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.LayoutServiceMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.MetaModelServicesMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.MetaModelServicesMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.SwaggerServiceMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.SwaggerServiceMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.TranslationServicePoMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.TranslationServicePoMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.HsqlDbManagerMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.HsqlDbManagerMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/service;serviceId=\"isisApplib.ConfigurationServiceMenu\"",
                "href": "http://localhost:8080/restful/services/isisApplib.ConfigurationServiceMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Configuration Service Menu"
            }
        ],
        "extensions": {},
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/list\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/homepage\""
            }
        ]

    };

    public static const SO_MENU:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Simple Objects"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/layout",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/layout",
                "method": "GET",
                "type": "application/xml;profile=\"urn:org.restfulobjects:repr-types/layout-bs3\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/services",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/list\""
            }
        ],
        "extensions": {
            "oid": "simple.SimpleObjectMenu:1",
            "isService": true,
            "isPersistent": true,
            "menuBar": "PRIMARY"
        },
        "title": "Simple Objects",
        "serviceId": "simple.SimpleObjectMenu",
        "members": {
            "listAll": {
                "id": "listAll",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"listAll\"",
                        "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "findByName": {
                "id": "findByName",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"findByName\"",
                        "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/findByName",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            },
            "create": {
                "id": "create",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"create\"",
                        "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/create",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }
    };

    public static const SO_LIST_ALL:Object = {

        "id": "listAll",
        "memberType": "action",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Simple Objects"
            },
            {
                "rel": "urn:org.restfulobjects:rels/invoke;action=\"listAll\"",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\"",
                "arguments": {}
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/actions/listAll",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/action-description\""
            }
        ],
        "extensions": {
            "actionType": "user",
            "actionSemantics": "safe"
        },
        "parameters": {}

    };

    public static const SO_LIST_ALL_INVOKE:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/action-result\"",
                "args": {}
            }
        ],
        "resulttype": "list",
        "result": {
            "value": [
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/10",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Foo"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/11",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Bar"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/12",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Baz"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/13",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Frodo"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/14",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Froyo"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/15",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Fizz"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/16",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Bip"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/17",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Bop"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/18",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Bang"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/19",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Boo"
                }
            ],
            "links": [
                {
                    "rel": "urn:org.restfulobjects:rels/return-type",
                    "href": "http://localhost:8080/restful/domain-types/java.util.List",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
                }
            ],
            "extensions": {}
        }
    };

    public static const SO_LIST_ALL_OBJECTS:Object = {

        "id": "objects",
        "memberType": "collection",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/isisApplib.DomainObjectList/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI_Pgo8bGlzdCB4bWxuczpjb209Imh0dHA6Ly9pc2lzLmFwYWNoZS5vcmcvc2NoZW1hL2NvbW1vbiI-CiAgICA8dGl0bGU-MTAgU2ltcGxlIE9iamVjdHM8L3RpdGxlPgogICAgPGFjdGlvbk93bmluZ1R5cGU-c2ltcGxlLlNpbXBsZU9iamVjdE1lbnU8L2FjdGlvbk93bmluZ1R5cGU-CiAgICA8YWN0aW9uSWQ-bGlzdEFsbDwvYWN0aW9uSWQ-CiAgICA8YWN0aW9uQXJndW1lbnRzPjwvYWN0aW9uQXJndW1lbnRzPgogICAgPGVsZW1lbnRPYmplY3RUeXBlPnNpbXBsZS5TaW1wbGVPYmplY3Q8L2VsZW1lbnRPYmplY3RUeXBlPgogICAgPG9iamVjdHM-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYwIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYxIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYyIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYzIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY0Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY1Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY2Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY3Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY4Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY5Ii8-CiAgICA8L29iamVjdHM-CjwvbGlzdD4K/collections/objects",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-collection\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/objects/isisApplib.DomainObjectList/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI_Pgo8bGlzdCB4bWxuczpjb209Imh0dHA6Ly9pc2lzLmFwYWNoZS5vcmcvc2NoZW1hL2NvbW1vbiI-CiAgICA8dGl0bGU-MTAgU2ltcGxlIE9iamVjdHM8L3RpdGxlPgogICAgPGFjdGlvbk93bmluZ1R5cGU-c2ltcGxlLlNpbXBsZU9iamVjdE1lbnU8L2FjdGlvbk93bmluZ1R5cGU-CiAgICA8YWN0aW9uSWQ-bGlzdEFsbDwvYWN0aW9uSWQ-CiAgICA8YWN0aW9uQXJndW1lbnRzPjwvYWN0aW9uQXJndW1lbnRzPgogICAgPGVsZW1lbnRPYmplY3RUeXBlPnNpbXBsZS5TaW1wbGVPYmplY3Q8L2VsZW1lbnRPYmplY3RUeXBlPgogICAgPG9iamVjdHM-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYwIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYxIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYyIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjYzIi8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY0Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY1Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY2Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY3Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY4Ii8-CiAgICAgICAgPGNvbTpvaWQgdHlwZT0ic2ltcGxlLlNpbXBsZU9iamVjdCIgaWQ9IjY5Ii8-CiAgICA8L29iamVjdHM-CjwvbGlzdD4K",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "10 Simple Objects"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.DomainObjectList/collections/objects",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/collection-description\""
            }
        ],
        "extensions": {
            "collectionSemantics": "list"
        },
        "value": [
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/60",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Foo"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/61",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Bar"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/62",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Baz"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/63",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Frodo"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/64",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Froyo"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/65",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Fizz"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/66",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Bip"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/67",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Bop"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/68",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Bang"
            },
            {
                "rel": "urn:org.restfulobjects:rels/value",
                "href": "http://localhost:8080/restful/objects/simple.SimpleObject/69",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Object: Boo"
            }
        ],
        "disabledReason": "Immutable"

    };

    public static const SO_0:Object = {
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
                "rel": "urn:org.apache.isis.restfulobjects:rels/layout",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObject/layout",
                "method": "GET",
                "type": "application/xml;profile=\"urn:org.restfulobjects:repr-types/layout-bs3\""
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
                "value": 1514897074953,
                "format": "utc-millisec",
                "extensions": {
                    "x-isis-format": "javasqltimestamp"
                },
                "disabledReason": "Contributed property"
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

    public static const SO_OBJECT_LAYOUT:Object = {
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

    public static const FR_OBJECT_LAYOUT:Object = {
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

    public static const FR_OBJECT:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-5:"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/object-layout",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/object-layout",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-5:"
            },
            {
                "rel": "urn:org.restfulobjects:rels/update",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
                "method": "PUT",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "arguments": {}
            }
        ],
        "extensions": {
            "oid": "*isisApplib.FixtureResult:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
            "isService": false,
            "isPersistent": true
        },
        "title": "domain-app-demo/persist-all/item-5:",
        "domainType": "isisApplib.FixtureResult",
        "instanceId": "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
        "members": {
            "fixtureScriptClassName": {
                "id": "fixtureScriptClassName",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"fixtureScriptClassName\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/fixtureScriptClassName",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": null,
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Immutable; Non-cloneable view models are read-only"
            },
            "key": {
                "id": "key",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"key\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/key",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": "domain-app-demo/persist-all/item-5",
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "object": {
                "id": "object",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"object\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/object",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": null,
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "className": {
                "id": "className",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"className\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/className",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": null,
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "rebuildMetamodel": {
                "id": "rebuildMetamodel",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"rebuildMetamodel\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/rebuildMetamodel",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/openRestApi",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/downloadLayoutXml",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/actions/clearHints",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }
    };

    public static const FR_OBJECT_PROPERTY:Object = {
        "id": "className",
        "memberType": "property",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=/properties/className",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS01PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjExNDwvb2JqZWN0LmJvb2ttYXJrPjwvbWVtZW50bz4=",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-5:"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult/properties/className",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/property-description\""
            }
        ],
        "value": null,
        "extensions": {
            "x-isis-format": "string"
        },
        "disabledReason": "Non-cloneable view models are read-only; Immutable"
    };

    public static const FR_PROPERTY_DESCRIPTION:Object = {
        "id": "className",
        "memberType": "property",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult/properties/className",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/property-description\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.restfulobjects:rels/return-type",
                "href": "http://localhost:8080/restful/domain-types/java.lang.String",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            }
        ],
        "optional": false,
        "extensions": {
            "friendlyName": "Result class"
        }
    };

    public static const FR_OBJECT_BAZ:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-3:  Object: Baz"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/object-layout",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/object-layout",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-3:  Object: Baz"
            },
            {
                "rel": "urn:org.restfulobjects:rels/update",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==",
                "method": "PUT",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "arguments": {}
            }
        ],
        "extensions": {
            "oid": "*isisApplib.FixtureResult:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==",
            "isService": false,
            "isPersistent": true
        },
        "title": "domain-app-demo/persist-all/item-3:  Object: Baz",
        "domainType": "isisApplib.FixtureResult",
        "instanceId": "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==",
        "members": {
            "fixtureScriptClassName": {
                "id": "fixtureScriptClassName",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"fixtureScriptClassName\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/fixtureScriptClassName",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": null,
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "key": {
                "id": "key",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"key\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/key",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": "domain-app-demo/persist-all/item-3",
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "object": {
                "id": "object",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"object\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/object",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": {
                    "rel": "urn:org.restfulobjects:rels/value",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/52",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Baz"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "className": {
                "id": "className",
                "memberType": "property",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;property=\"className\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/className",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
                    }
                ],
                "value": "domainapp.modules.simple.dom.impl.SimpleObject",
                "extensions": {
                    "x-isis-format": "string"
                },
                "disabledReason": "Non-cloneable view models are read-only; Immutable"
            },
            "rebuildMetamodel": {
                "id": "rebuildMetamodel",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"rebuildMetamodel\"",
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/actions/rebuildMetamodel",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/actions/openRestApi",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/actions/downloadLayoutXml",
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
                        "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS0zPC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjUyPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/actions/clearHints",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }
    };

}
}
