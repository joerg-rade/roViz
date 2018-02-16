package org.ro.to {
public class Property extends Member {
    internal var parameters:RObject;

    public function Property(jsonObj:RObject=null) {
        memberType = Member.PROPERTY;
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }
}
}
