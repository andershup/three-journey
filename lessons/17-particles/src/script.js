import './style.css'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import * as dat from 'lil-gui'

/**
 * Base
 */
// Debug
const gui = new dat.GUI()

// Canvas
const canvas = document.querySelector('canvas.webgl')

// Scene
const scene = new THREE.Scene()



/**
 * Textures
 */
const textureLoader = new THREE.TextureLoader()
const particleTexture = textureLoader.load('/textures/particles/2.png')



/**
 * Particles
 */
// Geometry
const particleGeometry = new THREE.BufferGeometry()
const count = 100000

const positions = new Float32Array(count * 3)
const colors = new Float32Array(count * 3)

for(let i = 0 ; i < count * 3 ; i++)
{  
    positions[i] = (Math.random() -0.5)  * 10
    colors[i] = Math.random()
}


particleGeometry.setAttribute('position', new THREE.BufferAttribute(positions, 3))
particleGeometry.setAttribute('color', new THREE.BufferAttribute(colors, 3))

console.log(particleGeometry.attributes)

//Material
const particlesMaterial = new THREE.PointsMaterial({
    size: 0.09,
    sizeAttenuation: true
})
particlesMaterial.color = new THREE.Color('yellowgreen')
particlesMaterial.transparent = true
particlesMaterial.alphaMap = particleTexture
// particlesMaterial.alphaTest = 0.001
// particlesMaterial.depthTest = false
particlesMaterial.depthWrite = false
particlesMaterial.blending = THREE.AdditiveBlending


particlesMaterial.vertexColors = true


//points 
// .Points vs .Mesh
const particles = new THREE.Points(particleGeometry, particlesMaterial)
scene.add(particles)




/**
 * Sizes
 */
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
}

window.addEventListener('resize', () =>
{
    // Update sizes
    sizes.width = window.innerWidth
    sizes.height = window.innerHeight

    // Update camera
    camera.aspect = sizes.width / sizes.height
    camera.updateProjectionMatrix()

    // Update renderer
    renderer.setSize(sizes.width, sizes.height)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
})

/**
 * Camera
 */
// Base camera
const camera = new THREE.PerspectiveCamera(75, sizes.width / sizes.height, 0.1, 100)
camera.position.z = 3
scene.add(camera)

// Controls
const controls = new OrbitControls(camera, canvas)
controls.enableDamping = true

/**
 * Renderer
 */
const renderer = new THREE.WebGLRenderer({
    canvas: canvas
})
renderer.setSize(sizes.width, sizes.height)
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))

/**
 * Animate
 */
const clock = new THREE.Clock()

const tick = () =>
{
    const elapsedTime = clock.getElapsedTime()

    //update particles
    // particles.rotation.y =  -elapsedTime/4

    for(let i = 0 ; i < count * 3 ; i ++) 
    {
      const i3 = i * 3  
      // to get the x position for the y animation
      const x = particleGeometry.attributes.position.array[i3]
      // to get y axis on each i3
      particleGeometry.attributes.position.array[i3 + 1] = Math.sin(elapsedTime  + x)
    }

    particleGeometry.attributes.position.needsUpdate = true

    // Update controls
    controls.update()

    // Render
    renderer.render(scene, camera)

    // Call tick again on the next frame
    window.requestAnimationFrame(tick)
}

tick()