using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor; // allows us to access the Editor namespace

public class TweenDemo : MonoBehaviour
{

    public AnimationCurve curve;

    public Transform pointA;
    public Transform pointB;

    private bool isPlaying = false;

    private float timeCurrent = 0;

    [Range(.25f, 5)]
    public float timeTotal = 2;



    void Update()
    {

        if (isPlaying)
        {
            timeCurrent += Time.deltaTime;
            DoInterp();
        }
    }


    public void StartTween(){
        isPlaying = true;
        timeCurrent = 0;
    }

    void DoInterp() {

        if (pointA == null || pointB == null) return;
        
        float p = timeCurrent / timeTotal;

        p = curve.Evaluate(p); // Changes p to the value from the curve in the editor

        Vector3 pos = AnimMath.Lerp(pointA.position, pointB.position, p);

        transform.position = pos;

        if (timeCurrent >= timeTotal) isPlaying = false;

    }
}

[CustomEditor(typeof(TweenDemo))] // Allows us to use the editor whwnever we're editing an object in the TweenDemo class
public class EditorTweenDemo : Editor {
    public override void OnInspectorGUI() // This function runs anytime the inspector is drawn
    {
        base.OnInspectorGUI();

        if (GUILayout.Button("Start Tween")) { // Button function returns true if the button is clicked

            (target as TweenDemo).StartTween();

        }
    }
}
