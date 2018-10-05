package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.Utils;
import org.ro.core.event.EventLog;
import org.ro.core.event.ListObserver;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectList;
import org.ro.layout.Layout;

public class PropertyDescriptionHandlerTest {

    public function PropertyDescriptionHandlerTest() {
    }

    //  BS3.xml <-(link.layout)- FR <-(up)- FR_PROPERTY_DESCRIPTION
    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var log:EventLog = EventLog.getInstance();
        var lo:ListObserver = new ListObserver();
        // when
        var xp:LogEntry = new LogEntry("", "GET", null);
        var json:Object = URLS.FR_PROPERTY_DESCRIPTION;
        xp.response = JSON.stringify(json);
        Globals.dispatcher.handle(xp);
        var upHref:String = Utils.getUpHref(xp.response);
        var selfHref:String = Utils.getSelfHref(json);
        var act:LogEntry = log.find(selfHref);
        //FIXME nothing tested right now!
        if (act != null) {
            var obs:ListObserver = act.observer as ListObserver;
            var ol:ObjectList = obs.getList();
            // then
            Assert.assertNotNull(ol);
            Assert.assertTrue(xp == act);

            //var url:String = tObject.getLayoutLink(); //"get URL from URLS.FR_PROPERTY_DESCRIPTION";
            // tObject.getLayoutLink
            // will only work, if it has been loaded ...
            var lyt:Layout = ol.getLayout();
            Assert.assertNotNull(lyt);

            var id:String = URLS.FR_PROPERTY_DESCRIPTION.id;
            var lbl:String = lyt.getPropertyLabel(id);
            Assert.assertNotNull(lbl);
        }
    }

}
}
