package org.ro {
import org.ro.to.Member;

public class MenuEntry {
    public var title:String;
    public var id:String;
    public var action:Member;
    public var itemId:String;
    public var itemTitle:String;

    function MenuEntry(title:String, id:String, action:Member) {
        this.title = title;
        this.id = id;
        this.action = action;
        this.itemId = action.getHref();
        this.itemTitle = action.id;
    }
    
}
}
