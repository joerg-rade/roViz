package org.ro.to {

public class Service extends AbstractTransferObject {
    public var serviceId:String;
    public var title:String;
    public var links:Array;
    public var members:Object;
    public var extensions:Object;
    public var actions:Array;

    public function Service(jsonObj:Object=null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    private function init():void {
        actions = [];
        for each(var m:Object in this.members) {
            actions.push(new Member(m));
        }
    }

}
}
