package org.ro.view {
import mx.collections.XMLListCollection;
import mx.controls.Tree;

public class SampleTree {
    public function SampleTree() {
    }

    private var company:XML =
            <node>
                <node label="Finance" code="200">
                    <node label="John H"/>
                    <node label="Sam K"/>
                </node>
                <node label="Operations" code="400">
                    <node label="Bill C"/>
                    <node label="Jill W"/>
                </node>
                <node label="Engineering" code="300">
                    <node label="Erin M"/>
                    <node label="Ann B"/>
                </node>
            </node>;

    public var companyData:XMLListCollection = new XMLListCollection(company.children());

/*    private function removeNode():void {
        var node:XML = XML(tree.selectedItem);
        if (node == null) return;

        var children:XMLList = XMLList(node.parent().children());
        for (var i:int = 0; i < children.length(); i++) {
            if (children[i].@label == node.@label) {
                delete children[i];
            }
        }
    }

    private function addNode():void {
        var node:XML = <node/>;
        node.@label = folderNameInput.text;

        var parentNode:XML;
        if (tree.selectedItem == null)
            companyData.addItem(node);
        else {
            parentNode = XML(tree.selectedItem);
            parentNode.appendChild(node);
            tree.expandItem(parentNode, true);
        }
        folderNameInput.text = '';
        selectNode(node);
    }     */

    private var _index:int;
    private var _isFounded:Boolean = false;

/*    private function selectNode(node:XML):void {
        _isFounded = false;
        _index = -1;
        for each(var parentNode:XML in companyData) {
            if (tree.isItemOpen(parentNode))
                loopAndFindXml(node, parentNode);
            else if (!_isFounded)
                _index++;
        }
        tree.selectedIndex = _index;
    }   */

/*    private function loopAndFindXml(node:XML, parentNode:XML):void {
        if (_isFounded)
            return;
        _index++;
        //trace('myNode , '+_index+' , '+parentNode.toXMLString());

        for (var i:int = 0; i < parentNode.children().length(); i++) {
            if (_isFounded)
                return;

            if (tree.isItemOpen(parentNode.node[i])) {
                //trace('loop');
                loopAndFindXml(node, parentNode.node[i]);
            }
            else {
                if (_isFounded)
                    return;
                _index++;
                //trace('myNode1 '+_index+' , '+parentNode.node[i].toXMLString());

                if (parentNode.node[i] == node) {
                    //trace('found');
                    _isFounded = true;
                    return;
                }
            }
        }
    }   */

    private function expandAllTreeNodes(tree:Tree):void {
        tree.expandChildrenOf(company, true);
    }

 /*   private function onCreationComplete():void {
        expandAllTreeNodes(tree);
    }   */

}
}
