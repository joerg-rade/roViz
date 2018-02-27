package org.ro.to {
public class Extensions extends BaseTO {
    public static const PRIMARY:String = "primary";
    public static const SECONDARY:String = "secondary";
    public static const IDEMPOTENT:String = "idempotent";
    public static const NON_IDEMPOTENT:String = "nonIdempotent";
    public static const NON_IDEMPOTENT_ARE_YOU_SURE:String = "nonIdempotentAreYouSure";

    internal var oid:String;
    internal var isService:Boolean;
    internal var isPersistent:Boolean;
    internal var menuBar:String; // TODO use constants [PRIMARY, , etc.]
    internal var actionSemantics:String; //enum? nonIdempotent, idempotent, nonIdempotentAreYouSure, etc.
    internal var actionType:String;
    internal var xIsisFormat:String; 
    internal var friendlyName:String; 

    public function Extensions(jsonObj:Object = null) {
        if (jsonObj != null) {
            var json:Object = fixXIsisFormat(jsonObj);
            this.fromObject(json);
        }
    }

    public function getActionType():String {
        return actionType;
    }

    public function getFriendlyName():String {
        return friendlyName;
    }

    //Workaround for https://issues.apache.org/jira/browse/ISIS-1850 would break RO Spec 1.0
    private function fixXIsisFormat(json:Object):Object {
        const search:String = "\"x-isis-format\":" ;
        const replace:String = "\"xIsisFormat\":";
        var origin:String = JSON.stringify(json);
        if (origin.indexOf(search) > 0) {
            var answer:String = origin.replace(search, replace);
            return JSON.parse(answer);
        }
        return json;
    }

}
}
