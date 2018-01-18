package org.ro.viz {
import mx.containers.VBox;

/**
 * Parse layout specification (either xml or json).
 * In case of non-menu layout, build a UIComponent.
 */
public class Layout {

    public var rows:Vector.<Row>;

    public function Layout() {
    }

    public function parse(json:Object):void {
        rows = Row.parse(json);
    }

    public function parseXml(xmlStr:String):void {
        var xmlWithNamespace:String = insertNameSpace();
        var xml:XML = new XML(xmlWithNamespace);
        rows = Row.parseXml(xml.children());

        //TODO raise ISIS issue?
        function insertNameSpace():String {
            // Xxx.layout.xml needs to amended by XML_NS in order to avoid AS parsing error.
            const XML_NS:String = " xmlns:cpt=\"isis-component\" xmlns:bs3=\"bootstrap3\"";
            return xmlStr.substring(0, 9) + XML_NS + xmlStr.substring(9, xmlStr.length);
        }
    }

    public function build():VBox {
        var result:VBox = new VBox();
        //TODO iterate over rows, recurse into columns, etc.
        for each(var r:Row in rows) {
            result.addChild(r.build());
        }
        return result;
    }

    public function getActions():Vector.<String> {
        var result:Vector.<String> = new Vector.<String>();
        var components:Vector.<Component> = rows[0].columns[0].components;
        for each(var c:Component in components) {
            if (c.id) {
                result.push(c.id)
            }
        }
        return result;
    }


}
}
