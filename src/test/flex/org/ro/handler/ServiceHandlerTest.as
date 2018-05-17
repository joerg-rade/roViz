package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.xhr.XhrLogEntry;

public class ServiceHandlerTest {
    public function ServiceHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var spock:Globals = Globals.getInstance();
        var dsp:Dispatcher = spock.getDsp();
        // when
        var le:XhrLogEntry = new XhrLogEntry("", "GET", null);
        le.response = JSON.stringify(URLS.RESTFUL_SERVICES); 
        dsp.handle(le);
        var m1:Menu = spock.getMenu();
        // then
        Assert.assertNotNull(m1);
        Assert.assertNotNull(m1.getItems());
    }

}
}
