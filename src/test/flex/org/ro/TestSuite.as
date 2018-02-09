package org.ro {
import org.ro.layout.LayoutTest;
import org.ro.to.ActionGETArgumentTest;
import org.ro.to.ActionPOSTArgumentFSTest;
import org.ro.to.ActionPOSTArgumentTest;
import org.ro.to.ActionPOSTDeleteTest;
import org.ro.to.ListTest;
import org.ro.to.MemberTest;
import org.ro.to.MenuTest;
import org.ro.to.ObjectListTest;
import org.ro.to.ServiceTest;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class TestSuite {

    public var t1:ActionGETArgumentTest;
    public var t2:LayoutTest;
    public var t3:ListTest;
    public var t4:MenuTest;
    public var t5:ServiceTest;
    public var t6:MemberTest;
    public var t7:ActionPOSTArgumentTest;
    public var t8:ActionPOSTArgumentFSTest;
    public var t9:ActionPOSTDeleteTest;
    public var t10:ObjectListTest;    
}
}
