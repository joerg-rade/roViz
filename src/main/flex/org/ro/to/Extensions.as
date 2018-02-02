package org.ro.to {
public class Extensions extends AbstractTransferObject {
    public static const PRIMARY:String = "primary";
    public static const SECONDARY:String = "secondary";
    public static const IDEMPOTENT:String = "idempotent";
    public static const NON_IDEMPOTENT:String = "nonIdempotent";
    public static const NON_IDEMPOTENT_ARE_YOU_SURE:String = "nonIdempotentAreYouSure";

    public function Extensions(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }
    public var oid:String;
    public var isService:Boolean;
    public var isPersistent:Boolean;
    public var menuBar:String; // TODO use constants [PRIMARY, , etc.]
    public var actionSemantics:String; //enum? nonIdempotent, idempotent, nonIdempotentAreYouSure, etc.
    public var actionType:String;
}
}
