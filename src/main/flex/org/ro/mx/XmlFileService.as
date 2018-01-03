package org.ro.mx {

import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.mxml.HTTPService;

public class XmlFileService extends HTTPService {

    public static function getDefaultMenuItems():XML {
        //TODO store encoded with master pw in sqllite, add dialog for appending more entries and input of master pw
        var menuItems:XML =
                <topmenu label="" icon="MenuIcon">
                    <submenu id="play" label="SimpleApp (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="sven"
                             password="pass"/>
                    <submenu id="play" label="ToDoApp (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="todoapp-admin"
                             password="pass"/>
                    <submenu type="separator"/>
                    <submenu id="play" label="SEMAT (http://semat.ofbizian.com/:80)"
                             url="http://semat.ofbizian.com/"
                             path="/restful/services/"
                             user="user"
                             password="user"/>
                    <submenu type="separator"/>
                    <submenu id="play" label="KNIfe (localhost:8080)"
                             url="http://localhost:8080"
                             path="/restful/services/"
                             user="sven"
                             password="pass"/>
                </topmenu>;
        return menuItems;
    }

    internal var result:XML = new XML();

    protected static function faultHandler(event:FaultEvent):void {
        Alert.show("XML File Fault");
    }

    public function XmlFileService() {
        useProxy = false;
        addEventListener(FaultEvent.FAULT, faultHandler);
        addEventListener(ResultEvent.RESULT, resultHandler);
    }

    protected function resultHandler(event:ResultEvent):void {
        result = event.result as XML;
    }

    public function invoke(url:String):void {
        cancel();
        this.url = url;
        send();
    }

}
}