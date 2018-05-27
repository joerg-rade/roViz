package org.ro.handler {
import org.ro.xhr.LogEntry;

/**
 * Interface for handling asynchronous XHR responses.
 * Due to the fact that XMLHttpRequests are called asynchronously, responses may arrive in random order as well.
 * @see: https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern
 * COR simplifies implementation of Dispatcher.
 *
 * @see org.ro.handler.AbstractHandler for more details
 */
public interface IHandler {

    function handle(logEntry:LogEntry):void;

    function canHandle(json:Object):Boolean;

    function doHandle(json:Object):void;
}
}
