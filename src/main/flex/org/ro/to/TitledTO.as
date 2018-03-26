package org.ro.to {
/**
 * 'abstract' superclass of TObject and Service
 */
public class TitledTO extends LinkedTO {
    internal var extensions:Object;
    internal var title:String;
    internal var members:Object;
    internal var memberList:Vector.<Invokeable>;

    public function TitledTO(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
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
