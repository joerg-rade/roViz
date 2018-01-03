package org.ro.ctrl {
/**
 * Interface for handling asynchronous XHR responses.
 * Due to the fact that XMLHttpRequests are called asynchronously, responses may arrive in random order as well.
 * @see: https://en.wikipedia.org/wiki/Chain-of-responsibility_pattern
 * COR simplifies implementation of Dispatcher.
 *
 * @see org.ro.ctrl.AbstractHandler for more details
 */
public interface IHandler {

    function handle(json:Object):void;

    function canHandle(json:Object):Boolean;
}
}
