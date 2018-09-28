package org.ro.core {
import mx.core.FlexGlobals;

import org.ro.core.event.EventLog;
import org.ro.core.event.LogEntry;
import org.ro.handler.Dispatcher;
import org.ro.view.IDockable;
import org.ro.view.RoMenuBar;
import org.ro.view.RoView;

/**
 * Single Point of Contact between view components and all other classes.
 *
 * Other classes: handler, transferObjects (to), etc.
 *
 * - keeps track of session (url, uid, pw)
 * - single point of entry for: view, dispatcher, and event log
 * 
 * @See https://en.wikipedia.org/wiki/Facade_pattern
 * @See https://en.wikipedia.org/wiki/Singleton_pattern
 */
public class Globals {
    private static var instance:Globals = null;
    private static var log:EventLog = initLog();

    private var view:RoView = null;

    public static var session:Session = new Session();
    public static var dispatcher:Dispatcher = new Dispatcher();

    public static function getLog():EventLog {
        if (log == null) {
            log = initLog();
        }
        return log;
    }

    private static function initLog():EventLog {
        var app:Object = FlexGlobals.topLevelApplication;
        if (app.hasOwnProperty("LOG")) {
            return app.LOG;
        } else {
            return new EventLog();
        }
    }

    /**
     * Should only be called from within this class,
     * but ActionScript does not support private constructors.
     */
    function Globals(view:RoView = null) {
        if (instance == null) {
            this.view = view;
            instance = this;
        }
    }

    public static function getInstance():Globals {
        if (instance == null) {
            instance = new Globals();
        }
        return instance;
    }

    public function getView():RoView {
        if (view == null) {
            view = new RoView();
        }
        return view;
    }
    
}
}
