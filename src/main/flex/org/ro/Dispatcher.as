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
        var svcLinks:ArrayCollection = parseLinks(jsonObj.value);
        menu = new Menu(svcLinks);
        for each (var l:Link in svcLinks) {
            l.invoke();
        }
        getView().body.addTab(svcLinks, "Services", serviceIcon);
        getView().menuBar.amend(svcLinks);
    }

    //FIXME handle members should not (only) be invoked via the context menu, but directly when 'services' are read.
    private function handleMembers(jsonObj:Object):void {
        var members:ArrayCollection = parseMembers(jsonObj.members);
        getView().body.addTab(members, "Actions", actionIcon);
    }

    private static function getView():RoView {
        return FlexGlobals.topLevelApplication.view;
    }

    //TODO refactor parseLink/Member into single function where the constructor is passed in as arg
    // public for test
    public static function parseLinks(objArray:Object):ArrayCollection {
        var links:Array = [];

        for each (var v:Object in objArray) {
            links.push(new Link(v));
        }
        return new ArrayCollection(links);
    }

    private static function parseMembers(objArray:Object):ArrayCollection {
        var members:Array = [];

        for each (var v:Object in objArray) {
            members.push(new Member(v));
        }
        return new ArrayCollection(members);
    }
    
}
}
