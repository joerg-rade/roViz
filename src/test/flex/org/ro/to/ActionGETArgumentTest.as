package org.ro.to {

import org.flexunit.Assert;

public class ActionGETArgumentTest {
    public function ActionGETArgumentTest() {
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/findByName")]
    public function testParseService():void {
        var action:Action = new Action(json);
        var links:Vector.<Link> = action.linkList;
        Assert.assertEquals(4, links.length);

        var invokeLink:Link = action.getInvokeLink();
        var args:Object = invokeLink.arguments;
        Assert.assertNotNull(args);
    }

    private var json:Object = {
        "id": "findByName",
        "memberType": "action",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/findByName",
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
                "rel": "urn:org.restfulobjects:rels/invoke;action=\"findByName\"",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/findByName/invoke",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\"",
                "arguments": {
                    "name": {
                        "value": null
                    }
                }
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/actions/findByName",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/action-description\""
            }
        ],
        "extensions": {
            "actionType": "user",
            "actionSemantics": "safe"
        },
        "parameters": {
            "name": {
                "num": 0,
                "id": "name",
                "name": "Name",
                "description": ""
            }
        }

    }
}
}
