package org.ro.to {
import org.ro.core.StringUtils;

public class RObject extends AbstractTransferObject {
    internal var links:Object;
    internal var linkList:Vector.<Link>;
    internal var extensions:Object;
    internal var title:String;
    internal var domainType:String;
    internal var instanceId:uint;
    internal var members:Object;
    internal var memberList:Vector.<IInvokeable>;

    public function RObject(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }

        function init():void {
            linkList = new Vector.<Link>();
            for each (var o:Object in links) {
                linkList.push(new Link(o));
            }
            memberList = new Vector.<IInvokeable>();
            for each (var m:Object in members) {
                memberList.push(new Member(m));
            }
        }
    }

    public function getLayoutLink():Link {
        for each(var l:Link in linkList) {
            if (StringUtils.endsWith(l.getHref(), "object-layout")) {
                return l;
            }
        }
        return null;
    }

    public function getMembers():Vector.<IInvokeable> {
        return this.memberList;
    }

    public function getDomainType():String {
        return this.domainType;
    }

    public function getProperties():Vector.<IInvokeable> {
        var result:Vector.<IInvokeable> = new Vector.<IInvokeable>();
        for each(var m:Member in memberList) {
            if (m.memberType == Member.PROPERTY) {
                result.push(m);
            }
        }
        return result;
    }

}
}
