var camera;
var scene;
var renderer;
var mesh;
var mouseX = 0;
var mouseY = 0;
var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;

init();
animate();

function init() {

    

    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 2000);
    camera.position.z = 100;

    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    var dynamicTexture = new THREEx.DynamicTexture(512, 512);
    var text = 'hello';
    dynamicTexture.clear('cyan')
			.drawText(text, undefined, 256, 'red');
    var texture = new THREE.TextureLoader().load("brick.jpg");
   // texture.wrapS = THREE.RepeatWrapping;
    //texture.wrapT = THREE.RepeatWrapping;
    //texture.repeat.set(4, 4);

    var geometry = new THREE.CubeGeometry(50, 20, 10);
    var material = new THREE.MeshBasicMaterial({ map: dynamicTexture.texture }),

    mesh = new THREE.Mesh(geometry, material);
    //mesh.position.z = -50;
    scene.add(mesh);

    renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    document.addEventListener('mousemove', onDocumentMouseMove, false);
    window.addEventListener('resize', onWindowResize, false);

    
}

function onDocumentMouseMove(event) {
    mouseX = (event.clientX - windowHalfX) / 2;
    mouseY = (event.clientY - windowHalfY) / 2;
}

function animate() {
    requestAnimationFrame(animate);
    render();
}
function render() {
    camera.position.x += (mouseX - camera.position.x) * .4;
    camera.position.y += (-mouseY - camera.position.y) * .4;
    camera.lookAt(scene.position);
    renderer.render(scene, camera);
}

function onWindowResize() {
    windowHalfX = window.innerWidth / 2;
    windowHalfY = window.innerHeight / 2;
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}