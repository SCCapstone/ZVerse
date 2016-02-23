var camera;
var scene;
var renderer;
var mesh;
var mouseX = 0;
var mouseY = 0;
var windowHalfX = window.innerWidth / 2;
var windowHalfY = window.innerHeight / 2;
var text1 = '';
var text2 = '';
var text3 = '';

init();
animate();

function init() {
    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, .01, 100);
    camera.position.z = 10;

    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    var texture = new THREE.TextureLoader().load("js/brick.jpg");
    var geometry = new THREE.CubeGeometry(5,3.1,2.9); //width, height, depth
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    //needed to make the text# variables global for other functions to be used

    var dynamicTexture = new THREEx.DynamicTexture(512, 512);
    dynamicTexture.context.font = "bolder 80px Verdana";
    dynamicTexture.drawText(text1, undefined, 140, 'black');
    var geometry1 = new THREE.CubeGeometry(3,3,3);
    var material1 = new THREE.MeshBasicMaterial({ map: dynamicTexture.texture });
    material1.transparent = true;
   // material1.opacity = 0.5;
    material1.polygonOffset = true;
    material1.polygonOffsetFactor = -0.2;
    mesh1 = new THREE.Mesh(geometry1, material1);
    scene.add(mesh1);

    var dynamicTexture1 = new THREEx.DynamicTexture(512, 512);
    dynamicTexture1.context.font = "bolder 80px Verdana";
    dynamicTexture1.drawText(text2, undefined, 280, 'black');
    var geometry2 = new THREE.CubeGeometry(3, 3, 3);
    var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
    material2.transparent = true;
    // material1.opacity = 0.5;
    material2.polygonOffset = true;
    material2.polygonOffsetFactor = -0.2;
    mesh2 = new THREE.Mesh(geometry2, material2);
    scene.add(mesh2);

    var dynamicTexture2 = new THREEx.DynamicTexture(512, 512);
    dynamicTexture2.context.font = "bolder 80px Verdana";
    dynamicTexture2.drawText(text3, undefined, 420, 'black');
    var geometry3 = new THREE.CubeGeometry(3, 3, 3);
    var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });
    material3.transparent = true;
    // material1.opacity = 0.5;
    material3.polygonOffset = true;
    material3.polygonOffsetFactor = -0.2;
    mesh3 = new THREE.Mesh(geometry3, material3);
    scene.add(mesh3);


    renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    document.addEventListener('mousemove', onDocumentMouseMove, false);
    window.addEventListener('resize', onWindowResize, false);
    
}

function onDocumentMouseMove(event) {
    mouseX = (event.clientX - windowHalfX) / 10;
    mouseY = (event.clientY - windowHalfY) / 10;
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

var dynamicTexture = new THREEx.DynamicTexture(512, 512);

function getText1(text) {
    text1 = text;
    dynamicTexture.clear();
    dynamicTexture.needsUpdate() = true;
    dynamicTexture.context.font = "bolder 80px Verdana";
    dynamicTexture.drawText(text1, undefined, 140, 'black');
    var geometry1 = new THREE.CubeGeometry(3,3,3);
    var material1 = new THREE.MeshBasicMaterial({ map: dynamicTexture.texture });
    material1.transparent = true;
   // material1.opacity = 0.5;
    material1.polygonOffset = true;
    material1.polygonOffsetFactor = -0.2;
    mesh1 = new THREE.Mesh(geometry1, material1);
    scene.add(mesh1);
    
}

var dynamicTexture1 = new THREEx.DynamicTexture(512, 512);

function getText2(text) {
    text2 = text;
    dynamicTexture1.clear();
    dynamicTexture1.context.font = "bolder 80px Verdana";
    dynamicTexture1.drawText(text2, undefined, 280, 'black');
    var geometry2 = new THREE.CubeGeometry(3, 3, 3);
    var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
    material2.transparent = true;
    // material1.opacity = 0.5;
    material2.polygonOffset = true;
    material2.polygonOffsetFactor = -0.2;
    mesh2 = new THREE.Mesh(geometry2, material2);
    scene.add(mesh2);
}

var dynamicTexture2 = new THREEx.DynamicTexture(512, 512);

function getText3(text) {
    text3 = text;
    dynamicTexture2.clear();
    dynamicTexture2.context.font = "bolder 80px Verdana";
    dynamicTexture2.drawText(text3, undefined, 420, 'black');
    var geometry3 = new THREE.CubeGeometry(3, 3, 3);
    var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });
    material3.transparent = true;
    // material1.opacity = 0.5;
    material3.polygonOffset = true;
    material3.polygonOffsetFactor = -0.2;
    mesh3 = new THREE.Mesh(geometry3, material3);
    scene.add(mesh3);
}