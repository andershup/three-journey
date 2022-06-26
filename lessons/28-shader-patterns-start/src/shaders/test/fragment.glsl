varying vec2 vUv;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}


void main()
{
    // float xBar = step(0.4, mod(vUv.x * 10.0-0.2, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0));
    // float yBar = step(0.8, mod(vUv.x * 10.0, 1.0)) * step(0.4 , mod(vUv.y * 10.0-0.2, 1.0));
    // float yBar = step(0.8, mod(vUv.y * 10.0, 1.0));
    // float strength = xBar + yBar;
    // float strength = step(0.4, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // float strength = floor(vUv.x * 10.0) /10.0;
// float strength = step(0.8,(mod(vUv.x * 10.0, 1.0))) *  step(0.8,(mod(vUv.y * 10.0, 1.0)));
// float strength = step(0.3,(mod(vUv.x * 10.0, 1.0))) *  step(0.8,(mod(vUv.y * 10.0, 1.0)));

// float barX = step(0.3,(mod(vUv.x * 10.0 - 0.2, 1.0))) *  step(0.8,(mod(vUv.y * 10.0, 1.0)));
// float barY = step(0.3,(mod(vUv.y * 10.0, 1.0))) *  step(0.8,(mod(vUv.x * 10.0 - 0.2, 1.0)));
// float strength = barX + barY; 

// float strength =  max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
// strength = step(0.4, strength);

vec2 gridUv = vec2((floor(vUv.x * 10.0) / 10.0) * (floor(vUv.y * 10.0) / 10.0));

 float strength = random(gridUv);
    gl_FragColor = vec4(strength,strength, strength, 1.0);
    
}