package org.ro.to {
public class Property extends Member {
    var parameters:Object;
    var extensions:Object;

    public function Property(jsonObj:Object=null) {
        memberType = Member.PROPERTY;
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }
}
}
