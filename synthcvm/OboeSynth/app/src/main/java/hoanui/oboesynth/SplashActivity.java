package hoanui.oboesynth;

/**
 * Created by Hoanui.
 */

/*
* activité du splash screen (écran d'accueil)*/
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.ActivityOptionsCompat;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;


import com.gigamole.library.PulseView;

public class SplashActivity extends Activity {

    PulseView pv;
    Button start;
    LinearLayout layoutMain;
    ProgressBar loading;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        pv =findViewById(R.id.pv);
        start= findViewById(R.id.Start);
        layoutMain = findViewById(R.id.content);
        loading = findViewById(R.id.loading);

        Intent i = new Intent(this, MainActivity.class);
        pv.startPulse();
        start.setAlpha(0);
        start.animate().alpha(1.0f).setDuration(2000).start();

        start.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                layoutMain.removeView(start);
                loading.setVisibility(View.VISIBLE);
                presentActivity(v);
            }
        });
    }



    public void presentActivity(View view) {

        ActivityOptionsCompat options = ActivityOptionsCompat.
                makeSceneTransitionAnimation(this, view, "transition");
        int revealX = (int) (view.getX() + view.getWidth() / 2);
        int revealY = (int) (view.getY() + view.getHeight() / 2);

        Intent intent = new Intent(this, MainActivity.class);
        intent.putExtra(MainActivity.EXTRA_CIRCULAR_REVEAL_X, revealX);
        intent.putExtra(MainActivity.EXTRA_CIRCULAR_REVEAL_Y, revealY);

        ActivityCompat.startActivity(this, intent, options.toBundle());
    }
}



