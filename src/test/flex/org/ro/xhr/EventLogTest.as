package org.ro.xhr {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Utils;
import org.ro.core.event.LogEntry;
import org.ro.core.event.EventLog;

public class EventLogTest {

    public function EventLogTest() {
    }

    [Test(description="logging of events (start/end)")]
    public function testSecondEntry():void {
        // given
        var log:EventLog = EventLog.getInstance();
        const initialSize:int = log.getEntries().length;
        const myFirst:String = "1";
        const myLast:String = "n";
        const myEveryThing:String = "..";

        const selfStr:String = Utils.toJsonString(URLS.RESTFUL_SERVICES);
        const selfUrl:String = Utils.getSelfHref(URLS.RESTFUL_SERVICES);
        const upStr:String = Utils.toJsonString(URLS.RESTFUL);
        const upUrl:String = Utils.getSelfHref(URLS.RESTFUL);

        // when
        log.start(selfUrl, myFirst, null);
        log.start(upUrl, myFirst, null);
        log.end(selfUrl, selfStr);
        log.end(upUrl, upStr);
        log.start(selfUrl, myLast, null);
        log.start(upUrl, myLast, null);
        // then
        var currentSize:int = log.getEntries().length;
        Assert.assertEquals(4 + initialSize, currentSize);

        // Entries with the same key can be written, but when updated or retrieved the first (oldest) entry should be used
        //when
        var leS:LogEntry = log.find(selfUrl);
        //then
        Assert.assertTrue(leS.method == myFirst);
        Assert.assertTrue(leS.response.length == selfStr.length)
        //when
        var leU:LogEntry = log.find(upUrl);
        //then
        Assert.assertTrue(leU.method == myFirst);
        Assert.assertTrue(leU.response.length == upStr.length)
    }

}
}
