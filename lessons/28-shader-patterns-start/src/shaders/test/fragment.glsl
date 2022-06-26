#define PI 3.1415926535897932384626433832795
varying vec2 vUv;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
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

// vec2 gridUv = vec2((floor(vUv.x * 10.0) / 10.0) * (floor(vUv.y * 10.0) / 10.0));

//  float strength = random(gridUv);
// float strength =  0.015 / distance(vUv, vec2(0.5, 0.5));

//    float strength = 0.15 / (distance(vec2(vUv.x, (vUv.y - 0.5) * 5.0 + 0.5), vec2(0.5)));
//     strength *= 0.15 / (distance(vec2(vUv.y, (vUv.x - 0.5) * 5.0 + 0.5), vec2(0.5)));
//     float rotating = rotate(vUv, PI * 0,25, vec2(0.5));
    
        // // Pattern 19
    float strength = 1.0 - step(0.01, abs(distance(vUv, vec2(0.5))-0.25));
       // // Pattern 27
    // float strength = distance(vUv, vec2(0.5));
    gl_FragColor = vec4(strength,strength, strength, 1.0);
    
}