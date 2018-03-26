package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.ObjectList;

public class TObjectHandlerTest {
    public function TObjectHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var dsp:Dispatcher = new Dispatcher();
        var t0:ObjectList = Globals.getInstance().getList();
        // when
        dsp.handle(URLS.SO_LIST_ALL);
        dsp.handle(URLS.SO_0);
        var t1:ObjectList = Globals.getInstance().getList();
        // then
        Assert.assertNull(t0);
        Assert.assertNotNull(t1);
        Assert.assertTrue(t1.length() >= 1);
    }

}
}
