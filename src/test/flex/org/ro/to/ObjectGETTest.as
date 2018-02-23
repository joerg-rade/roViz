package org.ro.to {

import org.flexunit.Assert;

public class ObjectGETTest {
    public function ObjectGETTest() {
    }

    [Test(description="parse result of invoking url")]
    public function testParseService():void {
        
        //   use json2.value.title as label
        
    }
    
    // up:
    // self: http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS00PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjgzPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/object 
    private var json2:Object = {
        "id": "object",
        "memberType": "property",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS00PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjgzPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==/properties/object",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-property\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/objects/isisApplib.FixtureResult/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PGtleT5kb21haW4tYXBwLWRlbW8vcGVyc2lzdC1hbGwvaXRlbS00PC9rZXk-PG9iamVjdC5ib29rbWFyaz5zaW1wbGUuU2ltcGxlT2JqZWN0OjgzPC9vYmplY3QuYm9va21hcms-PC9tZW1lbnRvPg==",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "domain-app-demo/persist-all/item-4:  Object: Frodo"
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureResult/properties/object",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/property-description\""
            }
        ],
        "value": {
            "rel": "urn:org.restfulobjects:rels/value",
            "href": "http://localhost:8080/restful/objects/simple.SimpleObject/83",
            "method": "GET",
            "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
            "title": "Object: Frodo"
        },
        "disabledReason": "Non-cloneable view models are read-only; Immutable"
    }

}
}
