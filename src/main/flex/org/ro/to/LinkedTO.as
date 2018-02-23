package org.ro.to {
/**
 *  Common 'abstract' superclass of Transfer Objects with 'links'.
 *  No Constructor.
 */
public class LinkedTO extends BaseTO {
    internal var links:Object;
    internal var linkList:Vector.<Link>;

    protected function init():void {
        linkList = new Vector.<Link>();
        for each (var o:Object in links) {
            linkList.push(new Link(o));
        }
    }

    public function getLinks():Vector.<Link> {
        return linkList;
    }

}
}
