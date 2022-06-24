varying vec2 vUv;

void main()
{
    // float xBar = step(0.4, mod(vUv.x * 10.0-0.2, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0));
    // float yBar = step(0.8, mod(vUv.x * 10.0, 1.0)) * step(0.4 , mod(vUv.y * 10.0-0.2, 1.0));
    // float yBar = step(0.8, mod(vUv.y * 10.0, 1.0));
    // float strength = xBar + yBar;
    // float strength = step(0.4, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    float strength = floor(vUv.x * 10.0) /10.0;
    strength *= floor(vUv.y * 10.0) /10.0;
    gl_FragColor = vec4(strength, strength, strength, 1.0);
    
}