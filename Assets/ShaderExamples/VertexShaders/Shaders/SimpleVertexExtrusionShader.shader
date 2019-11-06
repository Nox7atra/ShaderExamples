Shader "Custom/SimpleVertexExtrusionShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Amount ("Extrusion Amount", Range(0,1)) = 0.5
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
        float _Amount;
        void vert (inout appdata_full v) 
        {
              v.vertex.xyz += v.normal * _Amount;
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
