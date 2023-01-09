package com.example.guiacelulol;

import android.Manifest;
import android.app.SearchManager;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Message;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        permissao();
    }

    public void abrirGuia(View view){
        Intent intent = new Intent(this, listaChamp.class);
        startActivity(intent);
    }

    public void abrirSensor(View view){
        Intent sensorIntent = new Intent(this, Sensor.class);
        startActivity(sensorIntent);
    }

    public void siteWT(View view){
        Intent siteIntent = new Intent(Intent.ACTION_WEB_SEARCH);
        String query = "https://wildrift.leagueoflegends.com/pt-br/news/esports/wild-tour-brasil-2022-grupos-e-agenda-completa/";
        siteIntent.putExtra(SearchManager.QUERY, query);
        startActivity(siteIntent);
    }

    public void abrirMaps(View view) {
        Uri location = Uri.parse("geo:34.03263537836872, -118.45748108658526");
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, location);
        startActivity(mapIntent);
    }

    public void permissao(){
        if(ActivityCompat.checkSelfPermission(
                this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
                &&
                ActivityCompat.checkSelfPermission(
                        this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED
        ){
            ActivityCompat.requestPermissions(this, new String[] {Manifest.permission.ACCESS_FINE_LOCATION}, 1);
            ActivityCompat.requestPermissions(this, new String[] {Manifest.permission.ACCESS_COARSE_LOCATION}, 1);
            ActivityCompat.requestPermissions(this, new String[] {Manifest.permission.ACCESS_NETWORK_STATE}, 1);
            return;
        }

        LocationManager locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
        LocationListener locationListener= new Localizacao();
        locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, locationListener);
    }
}