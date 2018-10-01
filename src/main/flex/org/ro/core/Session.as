package org.ro.core {
import mx.utils.Base64Encoder;
import org.ro.core.Globals;

/**
 * - keeps track of connected server,
 */
public class Session {

    private var user:String;
    private var pw:String;
    private var url:String;

    /**
     * Should only be called from within this class,
     * but ActionScript does not support private constructors.
     */
    function Session() {
    }

    public function login(url:String, user:String, pw:String):void {
        this.user = user;
        this.pw = pw;
        this.url = url;
        Globals.getInstance().getView().getStatusBar().user.text = user;
    }

    public function getCredentials():String {
        var credentials:String = user + ":" + pw;
        var encoder:Base64Encoder = new Base64Encoder();
        encoder.insertNewLines = false;
        encoder.encode(credentials);
        credentials = encoder.toString();
        return credentials;
    }

}
}
