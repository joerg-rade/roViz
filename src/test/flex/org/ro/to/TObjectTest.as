package org.ro.to {

import org.flexunit.Assert;
import org.ro.URLS;

public class TObjectTest {
    public function TObjectTest() {
    }

    [Test(description="parse result of invoking object url")]
    public function testParse():void {
        var ro:TObject = new TObject(URLS.SO_0);
        Assert.assertNotNull(ro);
        Assert.assertNotNull(ro.getLayoutLink());
    }

}
}
