package org.ro {

import mx.collections.ArrayCollection;
import mx.core.FlexGlobals;

import org.ro.mx.RoView;
import org.ro.to.*;

/**
 * responsible for invoking urls, parsing results, and constructing data structures e.g for menus and tables.
 */
public class Dispatcher {

    [Embed(source='../../../resources/images/handshake.svg')]
    [Bindable]
    public var serviceIcon:Class;

    [Embed('../../../resources/images/exclamation-triangle.svg')]
    [Bindable]
    public var actionIcon:Class;
    
    public var credentials:String;
    public var user:String;
    public var url:String;
    public var menu:Menu;

    public function Dispatcher() {
    }

    public function handle(jsonObj:Object):void {
        if (isEmptyObject(jsonObj.extensions)) {
            handleServices(jsonObj)
        } else {
            handleMembers(jsonObj)
        }

        //private 
        function isEmptyObject(obj:Object):Boolean {
            return JSON.stringify(obj) === '{}';
        }
    }

    private function handleServices(jsonObj:Object):void {
        var svcLinks:ArrayCollection = Link.parse(jsonObj.value);
        menu = new Menu();
        for each (var l:Link in svcLinks) {
            // invoking each link (http://**Menu) asynchronously invokes
            // -> handMembers which adds each service.members as MenuEntry to Menu which 
            // -> finally updates menuBar
            l.invoke();
        }
        //TODO to be omitted after menuBar works
        getView().body.addTab(svcLinks, "Services", serviceIcon);
        getView().menuBar.amend(svcLinks);
    }

    private function handleMembers(jsonObj:Object):void {
        var members:ArrayCollection = Member.parse(jsonObj.members);
        menu.init(members);
        //TODO to be omitted after menuBar works
        getView().body.addTab(members, "Actions", actionIcon);
    }

    private static function getView():RoView {
        return FlexGlobals.topLevelApplication.view;
    }
    
}
}
