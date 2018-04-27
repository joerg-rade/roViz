package org.ro.to {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.ObjectList;
import org.ro.core.ObjectAdapter;

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
    public function testTObjectMembers():void {
        var to:TObject = new TObject(URLS.SO_0);
        Assert.assertTrue(to.title == "Object: Foo");

        var members:Vector.<Invokeable> = to.getMembers();
        Assert.assertEquals(10, members.length);

        var properties:Vector.<Invokeable> = to.getProperties();
        Assert.assertEquals(4, properties.length);

        var objectList:ObjectList = new ObjectList(1);
        objectList.addObject(properties);

        // this is kind of untyped again
        var oa:ObjectAdapter = objectList.last();
        Assert.assertTrue(oa.datanucleusIdLong == 0);
        Assert.assertTrue(oa.datanucleusVersionTimestamp == 1514897074953);
        Assert.assertTrue(oa.notes == "null");
    }
    
}
}
