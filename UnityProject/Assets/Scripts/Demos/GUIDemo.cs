using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro; // Must have to use Text Mesh Pro elements
using UnityEngine.UI; // Must have to program slider (and probably other things)

public class GUIDemo : MonoBehaviour
{

    public TMP_Text textPlayerHealth;
    public Slider slider;

    void Start()
    {
        if(slider) slider.value = Time.timeScale;
    }

    void Update()
    {
        textPlayerHealth.text = "Planet/Moon Name";
    }

    public void ButtonClicked() {
        print("BUTTON CLICKED");
    }

    public void SliderUpdated(float value) {
        Time.timeScale = value;
    }

}
