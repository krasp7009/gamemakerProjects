//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float add;

void main()
{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 baseColor = gl_FragColor;
    
	float num = 0.;
	float colorAvarage = (baseColor.r + baseColor.g + baseColor.b)/3.0;
    
	if (colorAvarage <  .5)
	{
		gl_FragColor.rgb += add;
	}
	else
	{ 
		gl_FragColor.rgb += -add;    
	}
    
    //gl_FragColor.rgb += add;
}
