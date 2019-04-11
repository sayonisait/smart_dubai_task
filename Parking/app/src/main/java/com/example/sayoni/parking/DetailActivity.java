package com.example.sayoni.parking;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.webkit.WebView;

public class DetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main2);
        WebView myWebView = (WebView) findViewById(R.id.webview);
        myWebView.loadUrl(getIntent().getExtras().getString("url"));
    }
}
