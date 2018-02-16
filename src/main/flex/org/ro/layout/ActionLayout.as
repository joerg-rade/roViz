package org.ro.layout {
public class ActionLayout extends MemberLayout {

    internal var bookmarking:String;
    internal var position:String;
    internal var cssClassFa:String;
    internal var cssClassFaPosition:String;

    public function ActionLayout(jsonObj:Object = null) {
        fromObject(json);
    }
}
}
