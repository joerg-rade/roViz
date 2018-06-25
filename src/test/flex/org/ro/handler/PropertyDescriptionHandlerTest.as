package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.event.LogEntry;
import org.ro.core.model.ObjectList;
import org.ro.layout.Layout;

public class PropertyDescriptionHandlerTest {

    public function PropertyDescriptionHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var HUB:Globals = Globals.getInstance();
        var xpList:ObjectList = new ObjectList();
        xpList.initSize(1);
        var xpLayout:Layout = new Layout();
        xpList.setLayout(xpLayout);
        HUB.setList(xpList);
        // when
        var le:LogEntry = new LogEntry("", "GET", null);
        le.response = JSON.stringify(URLS.FR_PROPERTY_DESCRIPTION);
        HUB.dspHandle(le);

        var obsList:ObjectList = HUB.getList();
        // then
        Assert.assertNotNull(obsList);
        Assert.assertTrue(xpList == obsList);
        var obsLayout:Layout = obsList.getLayout();
        Assert.assertNotNull(obsLayout);
        Assert.assertTrue(xpLayout == obsLayout);

        var id:String = URLS.FR_PROPERTY_DESCRIPTION.id;
        var lbl:String = obsLayout.getPropertyLabel(id);
        Assert.assertNotNull(lbl);
    }

}
}
