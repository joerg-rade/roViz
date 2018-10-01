package org.ro.core {
import org.ro.handler.Dispatcher;
import org.ro.view.RoView;

/**
 * Single Point of Contact between view components and all other classes.
 *
 * - keeps track of session (url, uid, pw)
 * - single point of entry for: view, dispatcher
 *
 * @See https://en.wikipedia.org/wiki/Facade_pattern
 * @See https://en.wikipedia.org/wiki/Singleton_pattern
 */
public class Globals {
    private static var instance:Globals = null;

    private var view:RoView = null;

    public static var session:Session = new Session();
    public static var dispatcher:Dispatcher = new Dispatcher();

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
