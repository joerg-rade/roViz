package org.ro.to {

import org.flexunit.Assert;

public class ActionPOSTArgumentFSTest {
    public function ActionPOSTArgumentFSTest() {
    }

    [Test(description="parse result of invoking url")]
    public function testParseService():void {
        var action:Action = new Action(json);
        var links:Vector.<Link> = action.getLinks();
        Assert.assertEquals(4, links.length);

        var invokeLink:Link = action.getInvokeLink();
        var args:Vector.<Argument> = invokeLink.argumentList;
        Assert.assertNotNull(args);
        Assert.assertEquals(2, args.length);

        var params:Vector.<Parameter> = action.parameterList;
        Assert.assertNotNull(params);
        Assert.assertEquals(2, params.length);

        var p:Parameter = action.findParameterByName("script");
        Assert.assertEquals("script", p.id);

        var choiceList:Vector.<Link> = p.choiceList;
        Assert.assertEquals(1, choiceList.length);

        var defaultChoice:Link = p.getDefaultChoice();
        Assert.assertTrue(choiceList[0].href == defaultChoice.href);
    }

    // http://localhost:8080/restful/services/isisApplib.FixtureScriptsDefault/actions/runFixtureScript
    private var json:Object = {
        "id": "runFixtureScript",
        "memberType": "action",
        "links": [
            {
                "rel": "self",
                "href": "http://localhost:8080/restful/services/isisApplib.FixtureScriptsDefault/actions/runFixtureScript",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
            },
            {
                "rel": "up",
                "href": "http://localhost:8080/restful/services/isisApplib.FixtureScriptsDefault",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title": "Prototyping"
            },
            {
                "rel": "urn:org.restfulobjects:rels/invoke;action=\"runFixtureScript\"",
                "href": "http://localhost:8080/restful/services/isisApplib.FixtureScriptsDefault/actions/runFixtureScript/invoke",
                "method": "POST",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\"",
                "arguments": {
                    "script": {
                        "value": null
                    },
                    "parameters": {
                        "value": null
                    }
                }
            },
            {
                "rel": "describedby",
                "href": "http://localhost:8080/restful/domain-types/isisApplib.FixtureScriptsDefault/actions/runFixtureScript",
                "method": "GET",
                "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/action-description\""
            }
        ],
        "extensions": {
            "actionType": "prototype",
            "actionSemantics": "nonIdempotent"
        },
        "parameters": {
            "script": {
                "num": 0,
                "id": "script",
                "name": "Script",
                "description": "",
                "choices": [
                    {
                        "rel": "urn:org.restfulobjects:rels/value",
                        "href": "http://localhost:8080/restful/objects/domainapp.application.fixture.scenarios.DomainAppDemo/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PHBhdGg-PC9wYXRoPjwvbWVtZW50bz4=",
                        "method": "GET",
                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                        "title": "Domain App Demo"
                    }
                ],
                "default": {
                    "rel": "urn:org.restfulobjects:rels/value",
                    "href": "http://localhost:8080/restful/objects/domainapp.application.fixture.scenarios.DomainAppDemo/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPG1lbWVudG8-PHBhdGg-PC9wYXRoPjwvbWVtZW50bz4=",
                    "method": "GET",
                    "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                    "title": "Domain App Demo"
                }
            },
            "parameters": {
                "num": 1,
                "id": "parameters",
                "name": "Parameters",
                "description": "Script-specific parameters (if any).  The format depends on the script implementation (eg key=value, CSV, JSON, XML etc)"
            }
        }
    };

}
}
