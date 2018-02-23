package org.ro.to {

import org.flexunit.Assert;

public class ListTest {
    public function ListTest() {
    }

    [Test(description="parse result of invoking url")]
    public function testListAllInvoke():void {
        var list:List = new List(json);
        var linkList:Vector.<Invokeable> = list.getResult().getValues();
        Assert.assertEquals(3, linkList.length);
    }

    // http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke
    private var json:Object = {
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
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/0",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Foo"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/1",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Bar"
                },
                {
                    "rel": "urn:org.restfulobjects:rels/element",
                    "href": "http://localhost:8080/restful/objects/simple.SimpleObject/2",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Object: Baz"
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

}
}
