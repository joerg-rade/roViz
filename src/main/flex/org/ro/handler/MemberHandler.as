package org.ro.handler {
import org.ro.core.Globals;
import org.ro.to.IInvokeable;
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
        var memberList:Vector.<IInvokeable> = Member.parse(jsonObj.members);
        var done:Boolean = getMenu().init(service, memberList);
        if (done) {
            Globals.amendMenu(getMenu());
        }
    }

}
}
