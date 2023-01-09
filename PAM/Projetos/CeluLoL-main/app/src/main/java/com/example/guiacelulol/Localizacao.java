package com.example.guiacelulol;

import android.location.Location;
import android.location.LocationListener;

public class Localizacao implements LocationListener {

    public static double latitude;
    public static double longetude;

    @Override
    public void onLocationChanged(Location location) {
        latitude = location.getLatitude();
        longetude = location.getLongitude();
    }
}