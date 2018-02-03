package org.ro.to {

import mx.collections.ArrayCollection;

import org.flexunit.Assert;
import org.ro.core.Menu;

public class ServiceTest {
    public function ServiceTest() {
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/simple.SimpleObjectMenu")]
    public function testParseService():void {
        var service:Service = new Service(json);

        Assert.assertEquals("Simple Objects", service.title);

        var actions:Vector.<Member> = service.memberList;
        Assert.assertEquals(3, actions.length);

        Assert.assertTrue(includesId(actions, "listAll"));
        Assert.assertTrue(includesId(actions, "findByName"));
        Assert.assertTrue(includesId(actions, "create"));

        // jsonObj contains '"members": {}' not '"members": []' 
        // in AS this results in an unordered list (Object{}), 
        // but intended is an ordered list (Array[])
        //TODO use layout.xml
    }

    private function includesId(list:Vector.<Member>, id:String):Boolean {
        for  each (var m:Member in list) {
            if (m.id == id) {
                return true;
            }
        }
        return false;
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/")]
    public function testParse():void {
        var svc:Service = new Service(json);
        var svcLinks:ArrayCollection = Link.parse(json.value);
        var menu:Menu = new Menu(1);
        menu.init(svc, svcLinks);

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
