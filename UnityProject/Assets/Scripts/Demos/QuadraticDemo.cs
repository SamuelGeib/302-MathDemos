using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class QuadraticDemo : MonoBehaviour
{

    public Transform StartPoint;
    public Transform ControlPoint;
    public Transform EndPoint;

    [Range(2, 100)]
    public int curveResolution = 10;

    // Tween Varaibles
    public float TweenTimeLength = 3; // Max time (Seconds)

    public AnimationCurve temporalEasing;

    private bool IsPlaying = false;
    private float TweenTimeCurrent = 0; // Current time


    void Start()
    {
        
    }

    void Update()
    {

        if(IsPlaying)TweenTimeCurrent += Time.deltaTime;

        // Calculating Percent for FindPointOnCurve();
        float p = TweenTimeCurrent / TweenTimeLength;
        p = Mathf.Clamp(p, 0, 1); // p will always be between 0 and 1

        p = temporalEasing.Evaluate(p);


        Vector3 pos = FindPointOnCurve(p);
        transform.position = pos;

        if (TweenTimeCurrent >= TweenTimeLength) IsPlaying = false;
    }

    public void PlayTween(bool fromBeginning = false)
    {
        IsPlaying = true;
        if (fromBeginning) TweenTimeCurrent = 0;
    }

    // This function renders Gizmos in the editor
    private void OnDrawGizmos() {
        Gizmos.DrawWireCube(ControlPoint.position, Vector3.one); // Vector3.one is a pre-built vector with values (1,1,1)
        //Gizmos.DrawCube(ControlPoint.position, Vector3.one); // Draws a solid cube
        //Gizmos.DrawLine(StartPoint.position, EndPoint.position); // Draws a line


        for (int i = 0; i < curveResolution; i++) {
            Vector3 a = FindPointOnCurve(i / (float)curveResolution);
            Vector3 b = FindPointOnCurve((i+1) / (float)curveResolution);

            Gizmos.DrawLine(a, b);
            
        }


    }

    // This function finds a point on a Quadratic Bezier curve
    Vector3 FindPointOnCurve(float percent)
    {
        Vector3 a = AnimMath.Lerp(StartPoint.position, ControlPoint.position, percent);
        Vector3 b = AnimMath.Lerp(ControlPoint.position, EndPoint.position, percent);

        return AnimMath.Lerp(a, b, percent);
    }

}

   
[CustomEditor(typeof(QuadraticDemo))] // Custom inspector
public class QuadraticDemoEditor : Editor // if we didn't have the line "Using UnityEditor" up at the top, we could say here: 
{
    // Overriding
    public override void OnInspectorGUI() {
        base.OnInspectorGUI();

        // If you click on the PlayTween button
        if(GUILayout.Button("PlayTween"))
        {
            /*
            QuadraticDemo demo = (QuadraticDemo)target; // demo knows its a quadratic thing
            demo.PlayTween();
            */

            (target as QuadraticDemo).PlayTween(true);

        }
    }
}
