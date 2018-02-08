package org.ro.handler {
import mx.collections.ArrayCollection;

import org.ro.core.Menu;
import org.ro.to.IInvokeable;
import org.ro.to.Link;

public class ServiceHandler extends AbstractHandler implements IHandler {
    public function ServiceHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return isEmptyObject(jsonObj.extensions);
    }

    public override function doHandle(jsonObj:Object):void {
        var svcLinks:Vector.<IInvokeable> = Link.parse(jsonObj.value);
        setMenu(new Menu(svcLinks.length));
        for each (var l:Link in svcLinks) {
            l.invoke();
        }
    }

}
}