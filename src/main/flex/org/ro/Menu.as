package org.ro {

import mx.collections.ArrayCollection;

import org.ro.to.*;

//FIXME collect all members of type action  and add them under the right title. 
// Multiple Services under the same title need to be grouped and separated .
public class Menu {

    internal var menuItems:Array = [];

    public function Menu(services:ArrayCollection = null) {
        if (services != null) {
            this.init(services);
        }
    }

    private function init(services:ArrayCollection):void {
        for each (var i:Object in services) {
            var title:String = i.title;
            var id:String = extractServiceId(i.rel);
            var item:String;
            var action:Member;
            var me:MenuEntry = new MenuEntry(title, id, item, action);
            menuItems.push(me);
        }
    }
    
    private function extractServiceId(rel:String):String {
        var id:String = rel.split("=")[1];
        var l:int = id.length;
        return id.substring(1, l - 1);
    }


}
}
