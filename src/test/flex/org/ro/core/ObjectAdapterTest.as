package org.ro.core {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.handler.AbstractHandler;
import org.ro.to.TObject;

public class ObjectAdapterTest {
    public function ObjectAdapterTest() {
    }

    [Test(description="parse result of invoking object url")]
    public function testObjectBAZ():void {
        // given
        var jsonStr:Object = URLS.FR_OBJECT_BAZ;
        var adaptee:Adaptable = new TObject(jsonStr);
        Assert.assertNotNull(adaptee);

        var title:String = "test title";
        var type:String = "Link";
        var icon:Class = null;
        // when
        var oa:ObjectAdapter = new ObjectAdapter(adaptee, title, type, icon);

        // then
        var expected:String = "domain-app-demo/persist-all/item-3:  Object: Baz";
        var actual:String = oa.getProperty("title");
        Assert.assertEquals(expected, actual);
    }

}
}
