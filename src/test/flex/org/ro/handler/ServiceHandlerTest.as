package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.event.LogEntry;

public class ServiceHandlerTest {

    public function ServiceHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        // when
        var le:LogEntry = new LogEntry("", "GET", null);
        le.response = JSON.stringify(URLS.RESTFUL_SERVICES);
        Globals.dspHandle(le);
        var m1:Menu = Globals.getMenu();
        // then
        Assert.assertNotNull(m1);
        Assert.assertNotNull(m1.getItems());
    }

}
}
