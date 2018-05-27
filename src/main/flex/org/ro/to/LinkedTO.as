package org.ro.to {
import org.ro.core.Utils;

/**
 *  Common 'abstract' superclass of Transfer Objects with 'links'.
 *  No Constructor.
 */
public class LinkedTO extends BaseTO {
    internal var links:Object;
    public var linkList:Vector.<Link>;

    protected function init():void {
        linkList = new Vector.<Link>();
        for each (var o:Object in links) {
            linkList.push(new Link(o));
        }
    }

    public function getLinks():Vector.<Link> {
        return linkList;
    }

    public function getLayoutLink():Link {
        var href:String;
        for each(var l:Link in linkList) {
            href = l.getHref();
            //TODO can be "object-layout" >= 1.16
            if (Utils.endsWith(href, "layout")) {
                return l;
            }
        }
        return null;
    }

}
}
