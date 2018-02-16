package org.ro.to {

public class Service extends AbstractTransferObject {
    internal var value:Object;          //TODO singular/plural
    internal var valueList:Vector.<IInvokeable>;
    internal var serviceId:String;
    internal var title:String;
    internal var links:Object;
    internal var linkList:Vector.<IInvokeable>;
    internal var members:Object;
    internal var extensions:Object;
    internal var memberList:Vector.<IInvokeable>;

    public function Service(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        valueList = new Vector.<IInvokeable>();
        for each(var v:Object in this.value) {
            valueList.push(new Link(v));
        }
        memberList = new Vector.<IInvokeable>();
        for each(var m:Object in this.members) {
            memberList.push(new Member(m));
        }
        linkList = new Vector.<IInvokeable>();
        for each(var l:Object in this.links) {
            linkList.push(new Link(l));
        }
    }

    public function getValues():Vector.<IInvokeable> {
        return valueList;
    }

    public function getMembers():Vector.<IInvokeable> {
        return memberList;
    }

    public function getLinks():Vector.<IInvokeable> {
        return linkList;
    }

    public function getTitle():String {
        return title;
    }

    public function getServiceId():String {
        return serviceId;
    }
    
}
}
