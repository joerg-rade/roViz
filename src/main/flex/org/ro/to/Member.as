package org.ro.to {
public class Member extends Invokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    internal var id:String;
    internal var memberType:String;
    internal var value:String;
    private var valueObject:Link;
    internal var format:String; // type information
    internal var extensions:Object;
    private var extensionObject:Extensions;
    internal var disabledReason:String;
    internal var optional:Object;

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
        extensionObject = new Extensions(extensions);
        //TODO use format and/or extensions.xIsisFormat on order to type
        valueObject = new Link(value);
    }

    public function getId():String {
        return id;
    }

    public function getValue():Object {
        return value;
    }

    public function getExtension():Extensions {
        return extensionObject;
    }
    
    public function getType():Class {
        if (format == "int") return Number;
        if (format == "utc-millisec") return Number;
        if (format == "string") return String;
        if (format == "object") return Link;
        return Object;
    }

}
}
