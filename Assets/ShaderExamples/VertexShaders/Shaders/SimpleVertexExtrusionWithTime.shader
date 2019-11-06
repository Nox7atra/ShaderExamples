Shader "Custom/SimpleVertexExtrusionWithTime"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Amplitude ("Extrusion Amplitude", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows vertex:vert

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
          float4 color : COLOR;
        };
        
        fixed4 _Color;
        float _Amplitude;
        void vert (inout appdata_full v) 
        {
              v.vertex.xyz += v.normal * _Amplitude * (1 - _SinTime.z);
        }
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = _Color;
            o.Albedo = c.rgb;
  
        }
        ENDCG
    }
    FallBack "Diffuse"
}
