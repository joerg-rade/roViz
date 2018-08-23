package org.ro.view.tab {
import mx.collections.ArrayList;
import mx.containers.HBox;
import mx.controls.Tree;

import org.ro.core.event.LogEntry;
import org.ro.core.event.Node;
import org.ro.view.ImageRepository;

public class TreeTab extends BaseTab {

    public function TreeTab(dataProvider:Vector.<LogEntry>) {
        this.id = "Tree";
        this.label = "Tree";
        this.icon = ImageRepository.TreeIcon;
        this.horizontalScrollPolicy = "auto";
        var tree:Tree = new Tree();
        tree.x = 8;
        tree.y = 40;
        tree.percentHeight = 100;
        tree.percentWidth = 90;
        tree.dataProvider = initData(dataProvider);
        this.addChild(tree);
        var details:HBox = new HBox();
        details.percentWidth = 10;
        details.percentHeight = 100;
        this.addChild(details);
    }

    private function initData(logEntries:Vector.<LogEntry>):ArrayList {
        // first pass
        var nodeList:ArrayList = createNodeList();
        // second pass: 
        findAndAssignChildren();
        // finally
        var rootList:ArrayList = findRootNodes();
        return rootList;

        function createNodeList():ArrayList {
            var list:ArrayList = new ArrayList();
            var n:Node;
            for each(var le:LogEntry in logEntries) {
                if (le.getResponse() != null) {
                    n = new Node(le);
                    list.addItem(n);
                }
            }
            return list;
        }

        function findAndAssignChildren():void {
            var thisUrl:String;
            var parentUrl:String;
            for each (var p:Node in nodeList) {
                thisUrl = p.label;
                for each (var c:Node in nodeList) {
                    parentUrl = c.getParentUrl() + "/";
                    if (thisUrl === parentUrl) {
                        p.addChild(c)
                    }
                }
            }
        }

        function findRootNodes():ArrayList {
            var list:ArrayList = new ArrayList();
            var parentUrl:String;
            for each (var n3:Node in nodeList) {
                parentUrl = n3.getParentUrl();
                if (parentUrl == null) {
                    list.addItem(n3)
                }
            }
            return list;
        }
    }

}
}
