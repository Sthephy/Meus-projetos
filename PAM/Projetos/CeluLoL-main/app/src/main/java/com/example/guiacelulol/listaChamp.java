package com.example.guiacelulol;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class listaChamp extends AppCompatActivity {

    public final static String EXTRA_MESSAGE = ".MESSAGE";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lista_champ);
    }

    private void infoChamp(int idChamp){
        Intent intent = new Intent(this, ExibirChamp.class);
        intent.putExtra(EXTRA_MESSAGE, idChamp);
        startActivity(intent);
    }

    public void Ashe(View view){
        infoChamp(0);
    }

    public void Kayle(View view){
        infoChamp(1);
    }

    public void Pantheon(View view){
        infoChamp(2);
    }

    public void KhaZix(View view){
        infoChamp(3);
    }

    public void Yasuo(View view){
        infoChamp(4);
    }

    public void Shen(View view){
        infoChamp(5);
    }
}