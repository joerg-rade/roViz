package org.ro.layout {
/**
 * abstract superclass of PropertyLayout, ActionLayout
 */
public class MemberLayout extends AbstractLayout {
    internal var named:String;
    internal var describedAs:String;
    internal var metadataError:String;
    internal var link:String;
    internal var id:String;
    internal var hidden:Boolean;
    internal var namedEscaped:String;
    internal var promptStyle:Object;

    public function getId():String {
        return id;
    }

    public function getDescribedAs():String {
        return describedAs;
    }

}
}
