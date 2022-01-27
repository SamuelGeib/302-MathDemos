using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAtCameraRig : MonoBehaviour
{

    public Transform target;

    public float desiredDistance = 10;


    void Start()
    {
        
    }

    void LateUpdate()
    {

        Vector3 vToTarget = target.position - transform.position;

        // ==== Position the Camera ===

        Vector3 targetPosition = -vToTarget;
        targetPosition.Normalize();
        targetPosition *= desiredDistance;

        targetPosition += target.position;

        transform.position = AnimMath.Ease(transform.position, targetPosition, .01f);


        // ==== Turning To Look At Target ==== (Important for Procedural Animation) *Foundational

        transform.rotation = Quaternion.LookRotation(vToTarget, Vector3.up); // Vector3.up = new Vector3(0, 1, 0)



    }
}
