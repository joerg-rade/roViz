package org.ro.to {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.ObjectList;

public class MemberTest {
    public function MemberTest() {
    }

    // http://localhost:8080/restful/domain-types/isisApplib.FixtureResult/properties/className
    [Test(description="parse result of invoking url")]
    public function testParse():void {
        var m:Member = new Member(URLS.FR_PROPERTY_DESCRIPTION);
        var extension:Extensions = m.getExtension();
        Assert.assertEquals("Result class", extension.getFriendlyName());
    }

    // http://localhost:8080/restful/objects/simple.SimpleObject/0
    [Test(description="parse result of invoking url")]
    public function testRObjectMembers():void {
        var ro:RObject = new RObject(URLS.SO_0);
        var members:Vector.<Invokeable> = ro.getMembers();
        Assert.assertEquals(10, members.length);

        var properties:Vector.<Invokeable> = ro.getProperties();
        Assert.assertEquals(4, properties.length);

        var objectList:ObjectList = new ObjectList(1);
        objectList.addObject(properties);
        var object:Object = objectList.last();
        Assert.assertTrue(object.name == "Foo");
        Assert.assertTrue(object.notes == null);
        Assert.assertTrue(object.datanucleusIdLong == 0);
        Assert.assertTrue(object.datanucleusVersionTimestamp == 1514897074953);
    }

}
}
