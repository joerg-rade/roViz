package org.ro {

import org.flexunit.Assert;
import org.ro.to.Action;

public class ActionTest {
    public function ActionTest() {
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/create")]
    public function testParseService():void {
        var actual:Action = new Action(json);
        var links:Array = actual.links;
        Assert.assertEquals(4, links.length);
    }
    
    private var json:Object = {
        "id": "create",
        "memberType": "action",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/create",
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
                "rel": "urn:org.restfulobjects:rels/invoke;action=\"create\"",
                "href": "http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/create/invoke",
                "method": "POST",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\"",
                "arguments": {
                    "name": {
                        "value": null
                    }
                }
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/actions/create",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/action-description\""
            }
        ],
        "extensions": {
            "actionType": "user",
            "actionSemantics": "nonIdempotent"
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
