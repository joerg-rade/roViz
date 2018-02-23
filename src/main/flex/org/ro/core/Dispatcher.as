package org.ro.core {
import org.ro.handler.*;
import org.ro.xhr.RequestLog;

/**
 * Aka: Controller
 * - keeps track of connected server,
 * - the menu,
 * - object lists, and
 * - delegates responses to handlers.
 */
public class Dispatcher {

    public var credentials:String;
    public var user:String;
    public var url:String;
    public var menu:Menu;
    public var list:ObjectList;
    private var delegate:IHandler;
    public var log:RequestLog;
    public var viewRegistry:ViewRegistry;

    public function Dispatcher() {
        log = new RequestLog();
        viewRegistry = new ViewRegistry();
        //TODO sequence of handlers should follow frequency of invocation in order minimize the time taken by unneeded 'canHandle()'
        var first:ServiceHandler = new ServiceHandler();
        var second:ActionHandler = new ActionHandler();
        var third:MemberHandler = new MemberHandler();
        var forth:ListHandler = new ListHandler();
        var fifth:ObjectListHandler = new ObjectListHandler();
        var sixth:LayoutHandler = new LayoutHandler();
        var last:DefaultHandler = new DefaultHandler();

        first.successor = second;
        second.successor = third;
        third.successor = forth;
        forth.successor = fifth;
        fifth.successor = sixth;
        sixth.successor = last;

        delegate = first;
    }

    public function handle(jsonObj:Object):void {
        delegate.handle(jsonObj);
    }

}
}