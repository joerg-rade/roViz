package org.ro.handler {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.layout.Layout;

public class PropertyDescriptionHandlerTest {
    public function PropertyDescriptionHandlerTest() {
    }

    [Test(description="handover json from service ")]
    public function testService():void {
        // given
        var spock:Globals = Globals.getInstance();
        var xpList:ObjectList = new ObjectList(1);
        var xpLayout:Layout = new Layout();
        xpList.setLayout(xpLayout);
        spock.setList(xpList);
        var dsp:Dispatcher = spock.getDsp();
        // when
//        dsp.handle(URLS.SO_LIST_ALL_OBJECTS);
        dsp.handle(URLS.FR_PROPERTY_DESCRIPTION);
        var obsList:ObjectList = spock.getList();
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
