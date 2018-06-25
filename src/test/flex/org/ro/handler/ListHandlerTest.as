package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectList;

public class ListHandlerTest {

    public function ListHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var m:Menu = new Menu(0);
        var HUB:Globals = Globals.getInstance();
        HUB.setMenu(m);
        // when
        var le:LogEntry = new LogEntry("", "GET", null);
        le.response = JSON.stringify(URLS.SO_LIST_ALL_INVOKE);
        HUB.dspHandle(le);
        var t1:ObjectList = HUB.getList();
        // then
        Assert.assertNotNull(t1);
    }

}
}
