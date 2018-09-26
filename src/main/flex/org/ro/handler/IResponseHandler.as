package org.ro.handler {
import org.ro.core.event.LogEntry;

/**
 * Interface for handling asynchronous XHR responses.
 * Due to the fact that XMLHttpRequests are called asynchronously, responses may arrive in random order as well.
 * @see: https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern
 * COR simplifies implementation of Dispatcher.
 * 
 * Implementing classes are responsible for: 
 * @item creating Objects from JSON responses,
 * @item creating/finding Observers (eg. ListObserver, ObjectObserver), and
 * @item setting Objects and Observers into LogEntry.
 * 
 * @see org.ro.handler.AbstractHandler for more details
 */
public interface IResponseHandler {

    function handle(logEntry:LogEntry):void;

    function canHandle(json:Object):Boolean;

    function doHandle(json:Object):void;
}
}
