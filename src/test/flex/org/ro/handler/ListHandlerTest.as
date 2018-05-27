package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.ObjectList;
import org.ro.xhr.LogEntry;

public class ListHandlerTest {
    public function ListHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var spock:Globals = Globals.getInstance();
        var dsp:Dispatcher = spock.getDsp();
        var m:Menu = new Menu(0);
        spock.setMenu(m);
        // when
        var le:LogEntry = new LogEntry("", "GET", null);
        le.response = JSON.stringify(URLS.SO_LIST_ALL_INVOKE);
        dsp.handle(le);
        var t1:ObjectList = spock.getList();
        // then
        Assert.assertNotNull(t1);
    }

}
}
