package org.ro.to {
public class Link extends Invokeable {
    internal var title:String; // optional
    internal var rel:String;
    internal var type:String;
    internal var arguments:Object;
    internal var args:Object; // optional, http://localhost:8080/restful/services/simple.SimpleObjectMenu/actions/listAll/invoke
    internal var argumentList:Vector.<Argument>;

    public function Link(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromJSON(jsonObj);
            init();
        }
    }

    override protected function init():void {
        super.init();
        argumentList = new Vector.<Argument>();
        for each(var o:Object in this.arguments) {
            argumentList.push(new Argument(o));
        }
    }

    public function setArgument(key:String, value:String):void {
        var k:String = key.toLowerCase();
        if (k == "script") {
            var href:Object = {"href": value};
            this.arguments[k].value = href;
        } else {
            this.arguments[k].value = value;
        }
    }

    public function getArgumentsAsJsonString():String {
        var obj:Object = this.arguments;
        var jsonString:String = JSON.stringify(obj);
        return jsonString;
    }
    
}
}
