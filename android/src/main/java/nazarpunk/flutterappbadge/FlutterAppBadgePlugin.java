package nazarpunk.flutterappbadge;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;

import androidx.core.app.NotificationCompat;

/**
 * FlutterAppBadgePlugin
 */
public class FlutterAppBadgePlugin implements MethodCallHandler, FlutterPlugin {

  private Context applicationContext;
  private MethodChannel channel;
  private static final String CHANNEL_NAME = "nazarpunk/flutter_app_badge";

  /**
   * Plugin registration.
   */

  @Override
  public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL_NAME);
    channel.setMethodCallHandler(this);
    applicationContext = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel.setMethodCallHandler(null);
    applicationContext = null;
  }

  @Override
  public void onMethodCall(MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "updateBadgeCount":
        Log.d("tag2", "updateBadgeCount");

        int importance = NotificationManager.IMPORTANCE_LOW;
        NotificationChannel mChannel = new NotificationChannel(id, name, importance);
        //new NotificationCompat.Builder(MainActivity.this, NotificationManager.IMPORTANCE_MIN).setNumber( Integer.valueOf( call.argument("count").toString() ) ).build();
        Notification notification = new NotificationCompat.Builder(MainActivity.this, mChannel)
                .setContentTitle("New Messages")
                .setContentText("You've received 3 new messages.")
                .setNumber(11)
                .build();

        //ShortcutBadger.applyCount(applicationContext, Integer.valueOf(call.argument("count").toString()));
        result.success(null);
        break;
      case "removeBadge":
        //ShortcutBadger.removeCount(applicationContext);
        //new NotificationCompat.Builder(MainActivity.this, NotificationManager.IMPORTANCE_MIN).setNumber(0).build();

        Log.d("tag1", "removeBadge");
        result.success(null);
        break;
      case "isAppBadgeSupported":
        //result.success(ShortcutBadger.isBadgeCounterSupported(applicationContext));
        result.success(true);
        break;
      default:
        result.notImplemented();
        break;
    }
  }
}
