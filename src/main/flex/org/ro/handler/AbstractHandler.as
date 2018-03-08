package org.ro.handler {

import org.ro.core.Globals;
import org.ro.core.Menu;
import org.ro.core.ObjectList;
import org.ro.to.Extensions;

/**
 *  Common 'abstract' superclass of Response Handlers.
 *  Constructor should not be called.
 */
public class AbstractHandler implements IHandler {
    public var successor:IHandler;

    /**
     * @see https://en.wikipedia.org/wiki/Template_method_pattern
     * @param jsonObj
     */
    public function handle(jsonObj:Object):void {
        if (canHandle(jsonObj)) {
            doHandle(jsonObj);
        } else {
            successor.handle(jsonObj);
        }
    }

    /**
     * Default implementation - should be overridden in subclasses.
     * @param jsonObj
     * @return
     */
    public function canHandle(jsonObj:Object):Boolean {
        return true;
    }

    /**
     * Must be overridden in subclasses
     * @param jsonObj
     * @return
     */
    public function doHandle(jsonObj:Object):void {
    }

    internal static function getDsp():Dispatcher {
        return Globals.getInstance().getDsp();
    }

    internal static function getMenu():Menu {
        return Globals.getInstance().getMenu();
    }

    internal static function setMenu(menu:Menu):void {
        Globals.getInstance().setMenu(menu);
    }

    internal static function getObjectList():ObjectList {
        return Globals.getInstance().getList();
    }

    internal static function setObjectList(objectList:ObjectList):void {
        Globals.getInstance().setList(objectList);
    }

    internal static function isEmptyObject(obj:Object):Boolean {
        return JSON.stringify(obj) === '{}';
    }

    internal static function asExtensions(jsonObj:Object):Extensions {
        return new Extensions(jsonObj.extensions);
    }

    internal function hasMembers(jsonObj:Object):Boolean {
        return (jsonObj.members != null);
    }

    internal function isService(jsonObj:Object):Boolean {
        return jsonObj.extensions.isService;
    }


}
}