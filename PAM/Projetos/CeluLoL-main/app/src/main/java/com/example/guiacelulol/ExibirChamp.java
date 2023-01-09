package com.example.guiacelulol;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class ExibirChamp extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_exibir_champ);

        Intent intentDisplay = getIntent();

        int idChamp = intentDisplay.getIntExtra(listaChamp.EXTRA_MESSAGE, 0);
        setInfos(idChamp);
        Log.v("id", String.valueOf(idChamp));
    }
    private void setInfos(int id) {
        TextView txtNome = (TextView) this.findViewById(R.id.txtNome);
        TextView txtDificul = (TextView) this.findViewById(R.id.txtDificul);
        TextView txtLore = (TextView) this.findViewById(R.id.txtLore);
        TextView txtTipo = (TextView) this.findViewById(R.id.txtTipo);
        TextView txtLane = (TextView) this.findViewById(R.id.txtLane);
        ImageView imgChamp = (ImageView) findViewById(R.id.imgChamp);

        String[][] champInfo = {
                {getResources().getString(R.string.nAshe), getResources().getString(R.string.dAshe), getResources().getString(R.string.iAshe), getResources().getString(R.string.tAshe), getResources().getString(R.string.lAshe), String.valueOf(R.drawable.ashe)},
                {getResources().getString(R.string.nKayle), getResources().getString(R.string.dKayle), getResources().getString(R.string.iKayle), getResources().getString(R.string.tKayle), getResources().getString(R.string.lKayle), String.valueOf(R.drawable.kayle)},
                {getResources().getString(R.string.nPantheon), getResources().getString(R.string.dPantheon), getResources().getString(R.string.iPantheon), getResources().getString(R.string.tPantheon), getResources().getString(R.string.lPantheon), String.valueOf(R.drawable.pantheon)},
                {getResources().getString(R.string.nKhaZix), getResources().getString(R.string.dKhaZix), getResources().getString(R.string.iKhaZix), getResources().getString(R.string.tKhaZix), getResources().getString(R.string.lKhaZix), String.valueOf(R.drawable.kha_zix)},
                {getResources().getString(R.string.nYasuo), getResources().getString(R.string.dYasuo), getResources().getString(R.string.iYasuo), getResources().getString(R.string.tYasuo), getResources().getString(R.string.lYasuo), String.valueOf(R.drawable.yasuo)},
                {getResources().getString(R.string.nShen), getResources().getString(R.string.dShen), getResources().getString(R.string.iShen), getResources().getString(R.string.tShen), getResources().getString(R.string.lShen), String.valueOf(R.drawable.shen)},
        };

        txtNome.setText(champInfo[id][0]);
        txtDificul.setText(champInfo[id][1]);
        txtLore.setText(champInfo[id][2]);
        txtTipo.setText(champInfo[id][3]);
        txtLane.setText(champInfo[id][4]);

        int ImgChamp = Integer.parseInt(champInfo[id][5]);

        imgChamp.setImageResource(ImgChamp);
    }

    public void recoChamp(View view){
        Intent intent = new Intent(this, Recomendacoes.class);
        startActivity(intent);
    }
}