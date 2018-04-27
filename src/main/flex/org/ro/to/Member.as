package org.ro.to {
import org.ro.core.Utils;

public class Member extends Invokeable {
    public static const ACTION:String = "action";
    public static const PROPERTY:String = "property";

    internal var id:String;
    internal var memberType:String;
    internal var value:Object;
    private var valueObject:Object;
    internal var format:String; 
    internal var extensions:Object;
    private var extensionObject:Extensions;
    internal var disabledReason:String;
    internal var optional:Object;

    public function Member(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
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
        var cls:Class = getType();
        valueObject = new cls(value);
    }

    public function getId():String {
        return id;
    }

    public function getValue():Object {
        return valueObject;
    }

    public function getExtension():Extensions {
        return extensionObject;
    }

    public function getMemberType():String {
        return memberType;
    }

    public function getType():Class {
        if (isNumber()) return Number;
        if (isString()) return String;
        if (format == "object") return Link;
        return Object;

        function isString():Boolean {
            return (format == "string") || (extensionObject.xIsisFormat == "string");
        }

        function isNumber():Boolean {
            return (format == "int") || (format == "utc-millisec");
        }
    }

}
}
