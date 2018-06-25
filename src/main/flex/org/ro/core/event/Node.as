package org.ro.core.event {
import mx.collections.ArrayCollection;

import org.ro.core.Utils;

public class Node {

    private var entry:LogEntry;
    public var children:ArrayCollection;
    public var label:String;

    public function Node(entry:LogEntry) {
        this.entry = entry;
        this.label = entry.url;
    }

    public function addChild(n:Node):void {
        if (children == null) {
            children = new ArrayCollection();
        }
        children.addItem(n);
    }

    public function getParentUrl():String {
        var result:String;
        var response:String = entry.getResponse();
        if (response != null) {
            result = Utils.getUpHref(response);
        }
        return result;
    }

}
}
