package org.ro {

import mx.collections.ArrayCollection;

import org.ro.to.*;

//FIXME collect all members of type action  and add them under the right title. 
// Multiple Services under the same title need to be grouped and separated .
public class Menu {

    internal var menuItems:Array = [];

    public function Menu() {
    }

    //FIXME this needs to be invoked after each call to a Menu-URL like 
    // http://localhost:8080/restful/services/simple.SimpleObjectMenu
    internal function init(service:Service, members:ArrayCollection):void {
        for each (var m:Member in members) {
            var title:String = service.title;
            var id:String = service.serviceId;
            var item:String = m.getServiceName();
            var action:Member = m;           
            var me:MenuEntry = new MenuEntry(title, id, item, action);
            menuItems.push(me);
        }
    }
    
    //obsolete?
    private function extractServiceId(rel:String):String {
        var id:String = rel.split("=")[1];
        var l:int = id.length;
        return id.substring(1, l - 1);
    }


}
}
