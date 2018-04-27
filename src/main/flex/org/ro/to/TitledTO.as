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
        var raw:Object;
        var m:Member;
        for (var prop:String in members) { 
            raw = members[prop];    
            m = new Member(raw)
            memberList.push(m);     
        }
    }

    public function getMembers():Vector.<Invokeable> {
        return this.memberList;
    }
    
}
}
