package org.ro.to {

import org.flexunit.Assert;
import org.ro.core.Menu;

public class MenuTest {
    public function MenuTest() {
    }

    [Test(description="ensure MenuEntries are unique")]
    public function testUnique():void {
        //given:
        var s1:Service = new Service(json1);
        var m1:Vector.<IInvokeable> = Member.parse(json1.members);
        var s2:Service = new Service(json2);
        var m2:Vector.<IInvokeable> = Member.parse(json2.members);
        //when
        var menu:Menu = new Menu(2);
        menu.init(s1, m1);
        menu.init(s2, m2);
        //then
        var size:int = menu.uniqueMenuTitles().length;
        Assert.assertTrue(1 == size);
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/simple.SimpleObjectMenu")]
    public function testParse():void {
        var service:Service = new Service(json);
        var members:Vector.<IInvokeable> = Member.parse(json.members);
        var menu:Menu = new Menu(1);
        menu.init(service, members);
        Assert.assertTrue(menu != null);
    }

    private var json:Object = {
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

    private var json1:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/isisApplib.LayoutServiceMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.LayoutServiceMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/layout",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.LayoutServiceMenu/layout",
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
            "oid": "isisApplib.LayoutServiceMenu:1",
            "isService": true,
            "isPersistent": true,
            "menuBar": "SECONDARY"
        },
        "title": "Prototyping",
        "serviceId": "isisApplib.LayoutServiceMenu",
        "members": {
            "downloadLayouts": {
                "id": "downloadLayouts",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"downloadLayouts\"",
                        "href": "http://localhost:8080/restful/services/isisApplib.LayoutServiceMenu/actions/downloadLayouts",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }

    };

    private var json2:Object = {
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/isisApplib.MetaModelServicesMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.MetaModelServicesMenu",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            },
            {
                "rel": "urn:org.apache.isis.restfulobjects:rels/layout",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.MetaModelServicesMenu/layout",
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
            "oid": "isisApplib.MetaModelServicesMenu:1",
            "isService": true,
            "isPersistent": true,
            "menuBar": "SECONDARY"
        },
        "title": "Prototyping",
        "serviceId": "isisApplib.MetaModelServicesMenu",
        "members": {
            "downloadMetaModel": {
                "id": "downloadMetaModel",
                "memberType": "action",
                "links": [
                    {
                        "rel": "urn:org.restfulobjects:rels/details;action=\"downloadMetaModel\"",
                        "href": "http://localhost:8080/restful/services/isisApplib.MetaModelServicesMenu/actions/downloadMetaModel",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                    }
                ]
            }
        }
    };
    
}
}
