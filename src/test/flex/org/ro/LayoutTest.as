package org.ro {

import org.flexunit.Assert;

public class LayoutTest {
    public function LayoutTest() {
    }

    // string was amended by xsi:schemaLocation="http://isis.apache.org/applib/layout/component http://isis.apache.org/applib/layout/component/component.xsd http://isis.apache.org/applib/layout/grid/bootstrap3 http://isis.apache.org/applib/layout/grid/bootstrap3/bootstrap3.xsd" xmlns:c="http://isis.apache.org/applib/layout/component" xmlns:bs3="http://isis.apache.org/applib/layout/grid/bootstrap3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    // in order to avoid error: 
    private var xmlNs:String = " xmlns:cpt=\"isis-component\" xmlns:bs3=\"bootstrap3\"";
    private var full:String = " xsi:schemaLocation=\"http://isis.apache.org/applib/layout/component http://isis.apache.org/applib/layout/component/component.xsd http://isis.apache.org/applib/layout/grid/bootstrap3 http://isis.apache.org/applib/layout/grid/bootstrap3/bootstrap3.xsd\" xmlns:cpt=\"http://isis.apache.org/applib/layout/component\" xmlns:bs3=\"http://isis.apache.org/applib/layout/grid/bootstrap3\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"";
    private var xmlStr:String = "<bs3:grid><bs3:row><bs3:col span=\"12\" unreferencedActions=\"true\"><cpt:domainObject/><cpt:action id=\"listAll\"/><cpt:action id=\"findByName\"/><cpt:action id=\"create\"/></bs3:col></bs3:row><bs3:row><bs3:col span=\"4\"><cpt:fieldSet name=\"General\" id=\"general\" unreferencedProperties=\"true\"/></bs3:col><bs3:col span=\"8\" unreferencedCollections=\"true\"/></bs3:row></bs3:grid>";

    [Test(description="parse result of invoking http://localhost:8080/restful/domain-types/simple.SimpleObjectMenu/layout")]
    public function testParse():void {
        var xmlWithNamespace:String = xmlStr.substring(0, 9) + xmlNs + xmlStr.substring(9, xmlStr.length);
        var xml:XML = new XML(xmlWithNamespace);
        var rows:Object = xml.children();
        var row0col0:Object = rows[0][0];
        var r:Object = row0col0[0];
        var c:Object = r.children()[0];
        var s:String = c.@span;
        Assert.assertEquals("12", s);
        var actions:Object = c.children();
        Assert.assertEquals("listAll", actions[1].@id);
    }

}
}
