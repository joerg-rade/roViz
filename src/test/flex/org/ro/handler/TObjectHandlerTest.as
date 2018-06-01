package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.core.Utils;
import org.ro.xhr.EventLog;
import org.ro.xhr.LogEntry;

public class TObjectHandlerTest {
    private var spock:Globals = Globals.getInstance();
    private var dsp:Dispatcher = spock.getDsp();
    private var log:EventLog = spock.getLog();

    public function TObjectHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var ol:ObjectList = spock.getList();
        // when
        var le0:LogEntry = createLogEntry(URLS.SO_LIST_ALL);
        dsp.handle(le0);
        var le1:LogEntry = createLogEntry(URLS.SO_0);
        dsp.handle(le1);
        // then
        Assert.assertNotNull(ol);
        Assert.assertTrue(ol.length() == 0);
        //After SO_LIST_ALL is invoked, a couple of other URL's (3 top menu items) are invoked automatically.
        // therefore the expected number is 5 (for SimpleApp and not 2!
        Assert.assertTrue(5 == log.getEntries().length);
    }

    private function createLogEntry(json:Object):LogEntry {
        const url:String = Utils.getSelfHref(json);
        const resp:String = JSON.stringify(json);
        var le:LogEntry = log.start(url, null, null);
        le.response = resp;
        return le;
    }

}
}
