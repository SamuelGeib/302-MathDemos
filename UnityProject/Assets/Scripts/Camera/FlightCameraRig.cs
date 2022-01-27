using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlightCameraRig : MonoBehaviour
{

    public float speed = 10;
    
    private float pitch = 0; // X rotation
    private float yaw = 0; // Y rotation

    public float mouseSensitivityX = 1;
    public float mouseSensitivityY = 1;


    private void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }


    void Update()
    {

    // =====  Uptate Position: ======

        float v = Input.GetAxis("Vertical"); // forward / back ('w' is 1, 's' is -1)
        float h = Input.GetAxis("Horizontal"); // left / right (strafe) ('d' is 1, 'a' is -1)



        //transform.position += transform.forward * v * Time.deltaTime;
        //transform.position += transform.forward * v * Time.deltaTime;

        
        Vector3 dir = transform.forward * v + transform.right * h; // Combo vector 
        if (dir.magnitude > 1) dir.Normalize();

        transform.position += dir * Time.deltaTime * speed;

        // ===== Update Rotation: ======
        // yaw (turn head side to side), pitch(nod head up and down), roll(turn head to side like dog)?
        float mx = Input.GetAxis("Mouse X"); // Yaw (Y)
        float my = Input.GetAxis("Mouse Y"); // Pitch (X)

        yaw += mx * mouseSensitivityX;
        pitch -= my * mouseSensitivityY;// -= to prevent inverted y-axis

        pitch = Mathf.Clamp(pitch, -89, 89);

        transform.rotation = Quaternion.Euler(pitch, yaw, 0);


    }
}
