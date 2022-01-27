using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OrbitCameraRig : MonoBehaviour
{

    public Transform thingToLookAt;

    private float pitch = 0;
    private float yaw = 0;
    private float dis = 10; // distance to targeted object

    public float mouseSensitivityX = 1;
    public float mouseSensitivityY = 1;
    public float scrollSensitivity = 1;

    private Camera cam;



    void Start()
    {
        cam = GetComponentInChildren<Camera>();
        Cursor.lockState = CursorLockMode.Locked;
    }

    void LateUpdate()
    {

    // ==== Rotation: ====
        float mx = Input.GetAxis("Mouse X"); // yaw (Y)
        float my = Input.GetAxis("Mouse Y");

        yaw += mx * mouseSensitivityX;
        pitch -= my * mouseSensitivityY;// -= to prevent inverted y-axis

        pitch = Mathf.Clamp(pitch, -89, 89);

        transform.rotation = Quaternion.Euler(pitch, yaw, 0);

        // === Dolly: === (Same as zoom)

        // Change Z value to 
        Vector2 scrollAmt = Input.mouseScrollDelta;
        dis += scrollAmt.y * scrollSensitivity;
        dis = Mathf.Clamp(dis, 5, 50);

        float z = AnimMath.Ease(cam.transform.localPosition.z, -dis, .0001f, Time.deltaTime);


        cam.transform.localPosition = new Vector3(0, 0, -dis);

    // ==== Position: ====
        if (thingToLookAt == null) return;
        //transform.position = thingToLookAt.position;

        // ease
        transform.position = AnimMath.Ease(transform.position, thingToLookAt.position, .001f);

    }
}
