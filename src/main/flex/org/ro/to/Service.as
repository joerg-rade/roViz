package org.ro.to {

public class Service extends AbstractTransferObject {
    public var serviceId:String;
    public var title:String;
    internal var links:Array;
    public var linkList:Vector.<Link>; //TODO convert links during init()?
    public var members:Object;
    public var extensions:Object;
    public var memberList:Vector.<Member>;

    public function Service(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        memberList = new Vector.<Member>();
        for each(var m:Object in this.members) {
            memberList.push(new Member(m));
        }
        linkList = new Vector.<Link>();
        for each(var l:Object in this.links) {
            linkList.push(new Link(l));
        }
    }

}
}
