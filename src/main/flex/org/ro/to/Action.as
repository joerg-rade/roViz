package org.ro.to {
public class Action extends Member {
    internal var parameters:Object;

    public function Action(jsonObj:Object = null) {
        memberType = Member.ACTION;
        super(jsonObj);
    }
}
}