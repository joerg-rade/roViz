package org.ro.to {
/**
 * 'abstract' superclass of TObject and Service
 */
public class TitledTO extends LinkedTO {
    public var extensions:Object;
    public var title:String;
    internal var members:Object;
    public var memberList:Vector.<Invokeable>;

    public function TitledTO(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
        memberList = new Vector.<Invokeable>();
        for each (var m:Object in members) {
            memberList.push(new Member(m));
        }
    }

    public function getMembers():Vector.<Invokeable> {
        return this.memberList;
    }
    
}
}
