using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeDemo : MonoBehaviour
{

    [Range(0, 3)]
    public float timeScale = 1;

    void Start()
    {
        
    }

    void Update()
    {

        Time.timeScale = timeScale; // Time.timeScale is the built-in Unity timeScale used to control time

        // how Delta Time works:
        //Time.deltaTime = Time.unscaledDeltaTime * Time.timeScale
    }
}
