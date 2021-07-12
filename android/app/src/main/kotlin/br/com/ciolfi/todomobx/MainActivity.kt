package br.com.ciolfi.todomobx

import android.widget.Toast
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

    private val CHANNEL = "todo.mobx/channel"

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{
            call, result ->
            if(call.method=="toastNative"){
                val message = call.argument<String>("message")?.toString()?:"Erro"
                Toast.makeText(applicationContext, message, Toast.LENGTH_LONG).show()
                result.success("Executado")
            } else{
                result.notImplemented()
            }
        }
    }
}
