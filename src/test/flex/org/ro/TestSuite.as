package org.ro {
import org.ro.handler.ListHandlerTest;
import org.ro.handler.PropertyDescriptionHandlerTest;
import org.ro.handler.ServiceHandlerTest;
import org.ro.layout.LayoutTest;
import org.ro.to.ActionGETArgumentTest;
import org.ro.to.ActionPOSTArgumentFSTest;
import org.ro.to.ActionPOSTArgumentTest;
import org.ro.to.ActionPOSTDeleteTest;
import org.ro.to.ListTest;
import org.ro.to.MemberTest;
import org.ro.to.MenuTest;
import org.ro.to.ObjectListTest;
import org.ro.to.TObjectTest;
import org.ro.to.ServiceTest;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class TestSuite {

    public var h1:ServiceHandlerTest;
    public var h2:ListHandlerTest;
    public var h3:PropertyDescriptionHandlerTest;
    public var h4:ServiceHandlerTest; 
    public var l1:LayoutTest;
    public var t1:ActionGETArgumentTest;
    public var t2:ActionPOSTArgumentFSTest;
    public var t3:ActionPOSTArgumentTest;
    public var t4:ActionPOSTDeleteTest;
    public var t5:ListTest;
    public var t6:MemberTest;
    public var t7:MenuTest;
    public var t8:ObjectListTest;
    public var t19:TObjectTest;
    public var t10:ServiceTest;

}
}
