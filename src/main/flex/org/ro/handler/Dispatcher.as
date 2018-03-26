package org.ro.handler {
/**
 * Delegates responses to handlers.
 */
public class Dispatcher {

    private var delegate:IHandler;

    public function Dispatcher() {
        //TODO sequence of handlers should follow frequency of invocation in order minimize the time taken by unneeded 'canHandle()'
        var first:ServiceHandler = new ServiceHandler();
        var second:ActionHandler = new ActionHandler();
        var third:MemberHandler = new MemberHandler();
        var forth:ListHandler = new ListHandler();
        var fifth:TObjectHandler = new TObjectHandler();
        var sixth:LayoutHandler = new LayoutHandler();
        var seventh:PropertyHandler = new PropertyHandler();
        var eighth:PropertyDescriptionHandler = new PropertyDescriptionHandler();

        var last:DefaultHandler = new DefaultHandler();

        first.successor = second;
        second.successor = third;
        third.successor = forth;
        forth.successor = fifth;
        fifth.successor = sixth;
        sixth.successor = seventh;
        seventh.successor = eighth;
        eighth.successor = last;

        delegate = first;
    }

    public function handle(jsonObj:Object):void {
        delegate.handle(jsonObj);
    }

}
}
