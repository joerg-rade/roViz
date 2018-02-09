package org.ro.to {
public class Extensions extends AbstractTransferObject {
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
    public var actionType:String;
    public var xIsisFormat:String; //TODO use workround ISIS-1849

    public function Extensions(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
        }
    }

}
}
