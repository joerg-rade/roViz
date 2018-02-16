package org.ro.layout {
public class PropertyLayout extends MemberLayout {

    internal var action:Object;
    internal var labelPosition:String;
    internal var multiLine:Boolean;
    internal var renderedAsDayBefore:Boolean;
    internal var typicalLength:uint;
    internal var unchanging:Object;

    public function PropertyLayout(jsonObj:Object = null) {
        fromObject(jsonObj);
    }

    public function getTypicalLength():uint {
        return typicalLength;
    }
    
}
}
