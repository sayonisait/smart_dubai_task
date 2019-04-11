package com.example.awokstarter;

import android.os.Bundle;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    System.out.println("Came to flutter activity");
    Toast.makeText(this,"Came to flutter activity",Toast.LENGTH_SHORT).show();
   // setContentView(R.layout.main);
  }
}
