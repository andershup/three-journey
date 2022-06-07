uniform vec3 uColor;
uniform sampler2D uTexture;
uniform float uPlusBit;
varying vec2 vUv;
varying float vElevation;

void main()
{
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + uPlusBit;
    gl_FragColor = textureColor;
    // gl_FragColor = vec4(vUv, 1.0, 1.0);
}