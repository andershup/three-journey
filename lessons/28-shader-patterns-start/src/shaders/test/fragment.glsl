varying vec2 vUv;

void main()
{
    // pattern 3
    // float barX = step(0.4 , mod(vUv.x * 10.0-0.2, 1.0)) * step(0.8 , mod(vUv.y * 10.0 , 1.0));
    // float barY = step(0.8 , mod(vUv.x * 10.0 , 1.0)) * step(0.4 , mod(vUv.y * 10.0-0.2, 1.0));
    // float strength = barX + barY;
   
    float strength = step(0.2, max(abs(vUv.y - 0.5), abs(vUv.x - 0.5)));
    gl_FragColor = vec4(strength, strength, strength, 1.0);
    
}