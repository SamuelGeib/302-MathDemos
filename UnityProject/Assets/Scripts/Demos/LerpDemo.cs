using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LerpDemo : MonoBehaviour
{

    public Transform pointA;
    public Transform pointB;

    //[Range(0, 1)] //[] denotes attributes, range allows us to use a slider in the editor. Super fancy 
    public float percent = 0;

    void DoInterpolation()
    {

        if (pointA == null) return;
        if (pointB == null) return; // Quit incase wither point isn't specified

        // lerp of position
        Vector3 pos = AnimMath.Lerp(pointA.position, pointB.position, percent, false);

        // lerp of rotation
        // Rotation is always controlled by Quaternions
        Quaternion rot = AnimMath.Lerp(pointA.rotation, pointB.rotation, percent);

        // todo: set this object's position to the lerp result 
        transform.position = pos;
        transform.rotation = rot;

    }
    private void OnValidate()
    {
        DoInterpolation();
        
    }

}
