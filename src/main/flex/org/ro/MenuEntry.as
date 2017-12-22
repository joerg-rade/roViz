package org.ro {
import org.ro.to.Member;

internal class MenuEntry {
    internal var title:String;
    internal var id:String;
    internal var item:String;
    internal var action:Member;

    function MenuEntry(title:String, id:String, item:String, action:Member) {
        this.title = title;
        this.id = id;
        this.item = item;
        this.action = action;
    }

}
}
