//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;

#region isometrico
/*
	vec2 offsetX, offsetY;
	float alpha;
	int lengthToCheck = 4; //base code was 4
	bool isOnDrawnPixel = false;
	offsetX.x = pixelW;
	
	offsetY.y = pixelH;
	
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord));
	
	if (alpha >= 1.0)
	{
		isOnDrawnPixel = true;
	}
	
	if (isOnDrawnPixel)
	{
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	}
	else
	{
		bool foundDrawnPixel = false;
		
		int distanceInLoop = -lengthToCheck;
		vec2 actualDistance;
		
		//loop for x-axis
		for(int i = distanceInLoop; i <= lengthToCheck; i++)
		{
			if (foundDrawnPixel)
			{
				break;	
			}
			
			vec4 pixelInFront = texture2D( gm_BaseTexture, v_vTexcoord + (offsetX * float(i)));
			
			if ( pixelInFront.a > .0)
			{
				alpha = 1.0;
				foundDrawnPixel = true;
			}
		}
		
		distanceInLoop = -lengthToCheck;
		
		for(int i = distanceInLoop; i <= lengthToCheck; i++)
		{
			if (foundDrawnPixel)
			{
				break;	
			}
			
			vec4 pixelInFront = texture2D( gm_BaseTexture, v_vTexcoord + (offsetY * float(i)));
			if ( pixelInFront.a > .0)
			{
				alpha = 1.0;
				foundDrawnPixel = true;
			}
		}
		
		
		
		float tomDeBranco = .5;
		
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		gl_FragColor.a = alpha;
		gl_FragColor.rgb = vec3(tomDeBranco,tomDeBranco,tomDeBranco);
*/
#endregion


void main()
{
	vec2 offsetX, offsetY;
	float alpha;
	int lengthToCheck = 4; //base code was 4
	bool isOnDrawnPixel = false;
	
	offsetX.x = pixelW;
	offsetY.y = pixelH;
	
	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord));
	
	if (alpha >= 1.0)
	{
		isOnDrawnPixel = true;
	}
	
	if (isOnDrawnPixel)
	{
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	}
	else
	{
		bool foundDrawnPixel = false;
		
		int distanceInLoop = -lengthToCheck;
		vec2 actualDistance;
		
		//loop for x-axis
		for(int i = distanceInLoop; i <= lengthToCheck; i++)
		{
			if (foundDrawnPixel)
			{
				break;	
			}
			
			vec4 pixelInFront = texture2D( gm_BaseTexture, v_vTexcoord + (offsetX * float(i)));
			
			if ( pixelInFront.a > .0)
			{
				alpha = 1.0;
				foundDrawnPixel = true;
			}
		}
		
		distanceInLoop = -lengthToCheck;
		
		for(int i = distanceInLoop; i <= lengthToCheck; i++)
		{
			if (foundDrawnPixel)
			{
				break;	
			}
			
			vec4 pixelInFront = texture2D( gm_BaseTexture, v_vTexcoord + (offsetY * float(i)));
			if ( pixelInFront.a > .0)
			{
				alpha = 1.0;
				foundDrawnPixel = true;
			}
		}
		
		
		
		float tomDeBranco = .5;
		
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
		gl_FragColor.a = alpha;
		gl_FragColor.rgb = vec3(tomDeBranco,tomDeBranco,tomDeBranco);
	}
}
