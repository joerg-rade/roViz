package org.ro.ctrl {

import org.ro.Globals;
import org.ro.Menu;
import org.ro.ObjectList;
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

    internal static function getMenu():Menu {
        return Globals.getView().dsp.menu;
    }

    internal static function setMenu(menu:Menu):void {
        Globals.getDsp().menu = menu;
    }

    internal static function getObjectList():ObjectList {
        return Globals.getDsp().list;
    }

    internal static function setObjectList(objectList:ObjectList):void {
        Globals.getDsp().list = objectList;
    }

    internal static function isEmptyObject(obj:Object):Boolean {
        return JSON.stringify(obj) === '{}';
    }

    public static function asExtensions(jsonObj:Object):Extensions {
        return new Extensions(jsonObj.extensions);
    }

}
}