package org.ro {
import org.ro.ctrl.ActionHandler;
import org.ro.ctrl.DefaultHandler;
import org.ro.ctrl.IHandler;
import org.ro.ctrl.ListHandler;
import org.ro.ctrl.MemberHandler;
import org.ro.ctrl.ServiceHandler;

/**
 * Aka: Controller
 * - keeps track of connected server,
 * - the menu and
 * - delegates responses to handlers.
 */
public class Dispatcher {

    public var credentials:String;
    public var user:String;
    public var url:String;
    public var menu:Menu;
    private var delegate:IHandler;

    public function Dispatcher() {
        var first:ServiceHandler = new ServiceHandler();
        var second:ActionHandler = new ActionHandler();
        var third:MemberHandler = new MemberHandler();
        var forth:ListHandler = new ListHandler();
        var last:DefaultHandler = new DefaultHandler();

        first.successor = second;
        second.successor = third;
        third.successor = forth;
        forth.successor = last;

        delegate = first;
    }

    public function handle(jsonObj:Object):void {
        delegate.handle(jsonObj);
    }

}
}