package org.ro.ctrl {
import mx.collections.ArrayCollection;

import org.ro.to.Member;
import org.ro.to.Service;

public class MemberHandler extends AbstractHandler implements IHandler {
    public function MemberHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return (jsonObj.members != null) && (jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var service:Service = new Service(jsonObj);
        var members:ArrayCollection = Member.parse(jsonObj.members);
        var done:Boolean = getMenu().init(service, members);
        if (done) {
            getView().menuBar.amend(getMenu());
        }
    }

}
}