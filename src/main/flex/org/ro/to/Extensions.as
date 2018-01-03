package org.ro.to {
public class Extensions extends AbstractTransferObject {
    public static const PRIMARY:String = "primary";
    public static const SECONDARY:String = "secondary";
    public static const IDEMPOTENT:String = "idempotent";
    public static const NON_IDEMPOTENT:String = "nonIdempotent";

    public var oid:String;
    public var isService:Boolean;
    public var isPersistent:Boolean;
    public var menuBar:String; // TODO use constants [PRIMARY, , etc.]
    public var actionSemantics:String; //enum? nonIdempotent, idempotent, etc.
    public var actionType:String;

    public function Extensions(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }
}
}
