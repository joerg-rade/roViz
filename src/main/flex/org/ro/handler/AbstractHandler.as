package org.ro.handler {
import org.ro.core.Utils;
import org.ro.core.event.LogEntry;
import org.ro.to.Extensions;

/**
 *  Common 'abstract' superclass of Response Handlers.
 *  Constructor should not be called.
 */
public class AbstractHandler implements IResponseHandler {
    public var successor:IResponseHandler;
    protected var logEntry:LogEntry;

    /**
     * @see https://en.wikipedia.org/wiki/Template_method_pattern
     * @param logEntry
     */
    public function handle(logEntry:LogEntry):void {
        this.logEntry = logEntry;
        var jsonObj:Object = getJsonObject(logEntry);
        if (null == jsonObj) {
            trace("jsonObj == null : " + logEntry.url);
        } else {
            if (canHandle(jsonObj)) {
                doHandle(jsonObj);
            } else {
                successor.handle(logEntry);
            }
        }
    }
    
    private function getJsonObject(logEntry:LogEntry):Object {
        var jsonStr:String = logEntry.getResponse();
        var jsonObj:Object = Utils.toJsonObject(jsonStr);
        return jsonObj;
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

    internal static function asExtensions(jsonObj:Object):Extensions {
        return new Extensions(jsonObj.extensions);
    }

    internal static function hasMembers(jsonObj:Object):Boolean {
        return (jsonObj.members != null);
    }

    internal static function isService(jsonObj:Object):Boolean {
        return jsonObj.extensions.isService;
    }

}
}