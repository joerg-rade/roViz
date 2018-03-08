package org.ro.layout {
import org.ro.to.Link;

/**
 * abstract superclass of PropertyLayout, ActionLayout
 */
public class MemberLayout extends AbstractLayout {
    internal var named:String;
    internal var describedAs:String;
    internal var metadataError:String;
    internal var link:String;
    protected var linkObject:Link;
    internal var id:String;
    internal var hidden:Boolean;
    internal var namedEscaped:String;
    internal var promptStyle:Object;

    public function MemberLayout(jsonObj:Object = null) {
        this.fromObject(jsonObj);
        init();
    }

    protected function init():void {
        linkObject = new Link(link);
    }
    
    public function getLink():Link {
        return linkObject;
    }

    public function getId():String {
        return id;
    }

    public function getDescribedAs():String {
        return describedAs;
    }

}
}
