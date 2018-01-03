package org.ro.ctrl {
import mx.collections.ArrayCollection;

import org.ro.Menu;
import org.ro.to.Link;

public class ServiceHandler extends AbstractHandler implements IHandler {
    public function ServiceHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return isEmptyObject(jsonObj.extensions);
    }

    public override function doHandle(jsonObj:Object):void {
        var svcLinks:ArrayCollection = Link.parse(jsonObj.value);
        setMenu(new Menu(svcLinks.length));
        for each (var l:Link in svcLinks) {
            l.invoke();
        }
    }

}
}