package org.ro.core.event {

/**
 * @see: https://en.wikipedia.org/wiki/Observer_pattern
 *
 * The difference to the original pattern is that there is usually m:1 relationship between LogEvent and Observer.
 * Observer is notified about changes to related LogEvents and decides when it is time to perform a certain operation, 
 * i.e. Create a view for a list of objects.
 */
public interface ILogEventObserver {
    function update(le:LogEntry):void;
}
}
