package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Menu;

public class ServiceHandlerTest {
    public function ServiceHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var spock:Globals = Globals.getInstance();
        var dsp:Dispatcher = spock.getDsp();
        // when
        dsp.handle(URLS.RESTFUL_SERVICES);
        var m1:Menu = spock.getMenu();
        // then
        Assert.assertNotNull(m1);
        Assert.assertNotNull(m1.getItems());
    }

}
}
