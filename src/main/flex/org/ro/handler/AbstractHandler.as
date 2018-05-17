package org.ro.handler {
import org.ro.core.Globals;
import org.ro.core.ObjectList;
import org.ro.to.Extensions;
import org.ro.xhr.XhrLogEntry;

/**
 *  Common 'abstract' superclass of Response Handlers.
 *  Constructor should not be called.
 */
public class AbstractHandler implements IHandler {
    public var successor:IHandler;
    protected var logEntry:XhrLogEntry;

    /**
     * @see https://en.wikipedia.org/wiki/Template_method_pattern
     * @param jsonObj
     */
    public function handle(logEntry:XhrLogEntry):void {
        this.logEntry = logEntry;
        var jsonStr:String = logEntry.response;
        var jsonObj:Object = JSON.parse(jsonStr);
        if (canHandle(jsonObj)) {
            doHandle(jsonObj);
        } else {
            successor.handle(logEntry);
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

    internal static function getObjectList():ObjectList {
        return Globals.getInstance().getList();
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