package com.example.guiacelulol;

import android.content.Intent;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;


public class Sensor extends AppCompatActivity {

    private Accelerometer accelerometer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sensor);

        accelerometer = new Accelerometer(this);

        accelerometer.setListener(new Accelerometer.Listener(){
            @Override
            public void onTranslation(float tx, float ty, float tz) {
                if(tx > 1.0f){
                    getWindow().getDecorView().setBackgroundColor(Color.GRAY);
                } else if(tx < -1.0f){
                    getWindow().getDecorView().setBackgroundColor(Color.BLACK);
                }
            }
        });
    }

    @Override
    protected void onResume(){
        super.onResume();

        accelerometer.register();
    }

    @Override
    protected void onPause(){
        super.onPause();

        accelerometer.unregister();
    }
}