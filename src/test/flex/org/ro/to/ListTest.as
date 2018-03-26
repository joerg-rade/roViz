package org.ro.to {

import org.flexunit.Assert;
import org.ro.URLS;

public class ListTest {
    public function ListTest() {
    }

    // http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke
    [Test(description="parse result of invoking url")]
    public function testListAllInvoke():void {
        var list:List = new List(URLS.SO_LIST_ALL_INVOKE);
        var linkList:Vector.<Invokeable> = list.getResult().getValues();
        Assert.assertEquals(10, linkList.length);
    }

}
}
