package org.ro.layout {
import org.ro.to.Link;

public class PropertyLayout extends MemberLayout {

    internal var action:Object;
    internal var labelPosition:String;
    internal var multiLine:Boolean;
    internal var renderedAsDayBefore:Boolean;
    internal var typicalLength:uint;
    internal var unchanging:Object;

    public function PropertyLayout(jsonObj:Object = null) {
        if (jsonObj != null) {
            this.fromObject(jsonObj);
            linkObject = new Link(jsonObj.link); //TODO
            //init();
        }
    }

    override protected function init():void {
        //TODO link has an unexpected value of [object Object] - WTF
        linkObject = new Link(link);
    }

    public function getTypicalLength():uint {
        return typicalLength;
    }

}
}
