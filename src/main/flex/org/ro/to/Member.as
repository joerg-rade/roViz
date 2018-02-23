package org.ro.to {
public class Member extends Invokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    internal var id:String;
    internal var memberType:String;
    internal var value:String;
    internal var format:String; // type information
    internal var extensions:Object;
    internal var disabledReason:String;

    public function Member(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
        var link:Link = linkList[0];
        href = link.getHref();
        method = link.getMethod();
    }

    public function getId():String {
        return id;
    }

    public function getValue():Object {
        return value;
    }

}
}
