package org.ro.core {
import org.flexunit.Assert;
import org.ro.URLS;
import org.ro.view.ImageRepository;
import org.ro.to.Invokeable;
import org.ro.to.TObject;

public class ObjectAdapterTest {
    public function ObjectAdapterTest() {
    }

    [Test(description="parse result of invoking object url")]
    public function testObjectBAZ():void {
        // given
        const jsonStr:Object = URLS.FR_OBJECT_BAZ;
        const adaptee:TObject = new TObject(jsonStr);
        Assert.assertNotNull(adaptee);

        const title:String = "test title";
        const type:String = "Link";
        var icon:Class = null;
        // when
        const oa:ObjectAdapter = new ObjectAdapter(adaptee, title, type, icon);

        // then
        const expectedTitle:String = "domain-app-demo/persist-all/item-3:  Object: Baz";
        const actualTitle:String = oa.title;
        Assert.assertEquals(expectedTitle, actualTitle);

        Assert.assertTrue(oa.hasOwnProperty("domainType"));
        Assert.assertTrue(oa.hasOwnProperty("instanceId"));

        //Expectations: 
        // 1: adaptee( TObject) has members (memberList?) mapped onto (dynamic) ObjectAdapter properties
        Assert.assertFalse(oa.hasOwnProperty("members"));   // only public attributes are 'adapted'
        Assert.assertTrue(oa.hasOwnProperty("memberList"));
        const memberList:Vector.<Invokeable> = oa.memberList;
        Assert.assertTrue(adaptee.getMembers() == memberList);

        // 2: icon is instance of ObjectIconRenderer
        const iconClass:Class = oa.getIcon();
        Assert.assertNotNull(iconClass);
   }

}
}
