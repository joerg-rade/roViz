package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.to.Invokeable;
import org.ro.to.Service;

public class MemberHandler extends AbstractHandler implements IHandler {
    public function MemberHandler() {
    }

    public override function canHandle(jsonObj:Object):Boolean {
        return (jsonObj.members != null) && (jsonObj.extensions.isService);
    }

    public override function doHandle(jsonObj:Object):void {
        var service:Service = new Service(jsonObj);
        var members:Vector.<Invokeable> = service.getMembers();
        var mnu:Menu = getMenu();
        var done:Boolean = mnu.init(service, members);
        if (done) {
            Globals.getInstance().amendMenu(mnu);
        }
    }

}
}
