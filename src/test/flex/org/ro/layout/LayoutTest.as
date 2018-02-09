package org.ro.layout {

import org.flexunit.Assert;

public class LayoutTest {
    public function LayoutTest() {
    }

    private var xmlStr:String = "<bs3:grid><bs3:row><bs3:col span=\"12\" unreferencedActions=\"true\"><cpt:domainObject/><cpt:action id=\"listAll\"/><cpt:action id=\"findByName\"/><cpt:action id=\"create\"/></bs3:col></bs3:row><bs3:row><bs3:col span=\"4\"><cpt:fieldSet name=\"General\" id=\"general\" unreferencedProperties=\"true\"/></bs3:col><bs3:col span=\"8\" unreferencedCollections=\"true\"/></bs3:row></bs3:grid>";

    [Test(description="parse result of invoking http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/layout")]
    public function testXmlMenuLayout():void {
        //when
        var lo:Layout = new Layout();
        lo.parseXml(xmlStr);
        // then
        var actions:Vector.<String> = lo.getActions();
        Assert.assertEquals(3, actions.length);
        Assert.assertEquals("listAll", actions[0]);
    }

    [Test(description="parse result of invoking http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/object-layout")]
    public function testObjectLayout():void {
        //when
        var lo:Layout = new Layout();
        lo.parse(json);
        // then
        var actions:Vector.<String> = lo.getActions();
        Assert.assertEquals(7, actions.length);
        Assert.assertEquals("listAll", actions[0]);
    }

    private var json:Object = {
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
                                    "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/listAll",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "listAll",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/createCurrent",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "createCurrent",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/createSalogCurrent",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "createSalogCurrent",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/createQTSeaCurrent",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "createQTSeaCurrent",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/createQTAirCurrent",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "createQTAirCurrent",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/create",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "create",
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
                                        "href": "http://localhost:8080/restful/objects/ife.cfg.vm.ReleaseComparisons/1/actions/openDependencyDiagramForChanges",
                                        "type": "application/json;profile=\"urn:org.restfulobjects:repr-types/object-action\""
                                    },
                                    "id": "openDependencyDiagramForChanges",
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

    }

}
}
