package org.ro.xhr {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.core.event.LogEntry;

public class EventLogTest {
    private static var HUB:Globals = Globals.getInstance();

    public function EventLogTest() {
    }

    [Test(description="logging of events (start/end)")]
    public function testSecondEntry():void {
        // given
        const initialSize:int = HUB.logEntries().length;
        const myFirst:String = "1";
        const myLast:String = "n";
        const myEveryThing:String = "..";

        const selfStr:String = Utils.toJsonString(URLS.RESTFUL_SERVICES);
        const selfUrl:String = Utils.getSelfHref(URLS.RESTFUL_SERVICES);
        const upStr:String = Utils.toJsonString(URLS.RESTFUL);
        const upUrl:String = Utils.getSelfHref(URLS.RESTFUL);

        // when
        HUB.logStart(selfUrl, myFirst, null);
        HUB.logStart(upUrl, myFirst, null);
        HUB.logEnd(selfUrl, selfStr);
        HUB.logEnd(upUrl, upStr);
        HUB.logStart(selfUrl, myLast, null);
        HUB.logStart(upUrl, myLast, null);
        // then
        var currentSize:int = HUB.logEntries().length;
        Assert.assertEquals(4 + initialSize, currentSize);

        // Entries with the same key can be written, but when updated or retrieved the first (oldest) entry should be used
        //when
        var leS:LogEntry = HUB.logFind(selfUrl);
        //then
        Assert.assertTrue(leS.method == myFirst);
        Assert.assertTrue(leS.response.length == selfStr.length)
        //when
        var leU:LogEntry = HUB.logFind(upUrl);
        //then
        Assert.assertTrue(leU.method == myFirst);
        Assert.assertTrue(leU.response.length == upStr.length)
    }

}
}
