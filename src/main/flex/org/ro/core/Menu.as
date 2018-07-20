package org.ro.core {
import org.ro.to.Invokeable;
import org.ro.to.Member;
import org.ro.to.Service;

public class Menu {

    private var limit:int;
    private var count:int;
    internal var menuItems:Array = [];

    public function Menu(limit:int) {
        this.limit = limit;
    }

    public function init(service:Service, invokableList:Vector.<Invokeable>):Boolean {
        for each (var m:Member in invokableList) {
            var title:String = service.getTitle();
            var id:String = service.getServiceId();
            var action:Member = m;
            var me:MenuEntry = new MenuEntry(title, id, action);
            menuItems.push(me);
        }
        count = count + 1;
        return (count >= limit);
    }

    public function uniqueMenuTitles():Array {
        var titles:Array = [];
        for each(var me:MenuEntry in menuItems) {
            titles.push(me.title);

        }
        var result:Array = collectUnique(titles);
        return result;

        //private 
        function collectUnique(titles:Array):Array {
            var result:Array = [];
            var dict:Object = new Object();
            for each(var t:String in titles) {
                if (dict[t] == null) {
                    dict[t] = t;
                    result.push(t);
                }
            }
            return result;
        }
    }

    public function findEntriesByTitle(title:String):Array {
        var result:Array = [];
        for each(var me:MenuEntry in menuItems) {
            if (me.title == title) {
                result.push(me);
            }
        }
        return result;
    }

    public function findAction(url:String):Member {
        for each(var me:MenuEntry in menuItems) {
            if (me.itemId == url) {
                return me.action;
            }
        }
        return null;
    }

    public function getItems():Array {
        return menuItems;
    }

}
}
