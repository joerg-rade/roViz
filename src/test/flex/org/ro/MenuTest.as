package org.ro {

import mx.collections.ArrayCollection;

import org.flexunit.Assert;
import org.ro.to.Member;
import org.ro.to.Service;

public class MenuTest {
    public function MenuTest() {
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/simple.SimpleObjectMenu")]
    public function testParse():void {
        //TODO extract as well:
        // title, serviceId, menuBar, isService , eventually: links[1].layouLink
        var service:Service = new Service(json);
        var members:ArrayCollection = Member.parse(json.members);
        var menu:Menu = new Menu();
        menu.init(service, members);

        Assert.assertEquals(menu != null, true);
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

    }
}
}
