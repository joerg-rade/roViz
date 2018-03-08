package org.ro.handler {
import org.ro.URLS;
import org.ro.handler.Dispatcher;

public class ServiceHandlerTest {
    public function ServiceHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var dsp:Dispatcher = new Dispatcher();
        // when
        dsp.handle(URLS.RESTFUL_SERVICES);
        // then
    }

}
}
