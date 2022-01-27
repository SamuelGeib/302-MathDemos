using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class OrbitDemo : MonoBehaviour
{

    public Transform orbitCenter;


    public float radius = 10; // UInit is Meters
    public int pathResolution = 32;


    private LineRenderer path;


    // Start is called before the first frame update
    void Start()
    {
        path = GetComponent<LineRenderer>();

        path.loop = true;
        path.useWorldSpace = true;

        UpdateOrbitPath();
    }

    
    void Update()
    {
        if (!orbitCenter) return;

        float x = radius * Mathf.Cos(Time.time);
        float z = radius * Mathf.Sin(Time.time);

        transform.position = new Vector3(x, 0, z) + orbitCenter.position;

        if (orbitCenter.hasChanged) UpdateOrbitPath();
    }

    void UpdateOrbitPath() {

        if (!orbitCenter) return;

        float radsPerCircle = 2 * Mathf.PI;

         // Resolution: The number of points we use to calculate the path of orbit

        Vector3[] pts = new Vector3[pathResolution]; // [] means array

        for (int i = 0; i < pts.Length; i++)
        {

            float x = radius * Mathf.Cos(i * radsPerCircle / pathResolution);
            float z = radius * Mathf.Sin(i * radsPerCircle / pathResolution);

            pts[i] = new Vector3(x, 0, z) + orbitCenter.position;
        }

        path.positionCount = pathResolution;
        path.SetPositions(pts);

    }
}
