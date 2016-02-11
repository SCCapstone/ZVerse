﻿var camera;
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

   //var dynamicTexture = new THREEx.DynamicTexture(512, 512)
    //dynamicTexture.clear('white')
      //  .drawText('hello', undefined, 256, 'black')
    var texture = new THREE.TextureLoader().load("brick.jpg");
 

    var geometry = new THREE.CubeGeometry(50, 20, 10);
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    document.addEventListener('mousemove', onDocumentMouseMove, false);
    window.addEventListener('resize', onWindowResize, false);

    //var text2 = document.createElement('div');
    //text2.style.position = 'absolute';
    ////text2.style.zIndex = 1;    // if you still don't see the label, try uncommenting this
    //text2.style.width = 200;
    //text2.style.height = 200;
    ////text2.style.backgroundColor = "blue";
    //text2.innerHTML = "hi there!";
    //text2.style.top = 325 + 'px';
    //text2.style.left = 550 + 'px';
    //document.body.appendChild(text2);

    // create a canvas element
    var canvas1 = document.createElement('canvas');
    var context1 = canvas1.getContext('2d');
    context1.font = "Bold 30px Arial";
    context1.fillStyle = "rgba(255,0,0,0.95)";
    context1.fillText('Alexa', 0, 20);

    // canvas contents will be used for a texture
    var texture1 = new THREE.Texture(canvas1)
    texture1.needsUpdate = true;

    var material1 = new THREE.MeshBasicMaterial({ map: texture1 });
    material1.transparent = true;
    var mesh1 = new THREE.Mesh(
        new THREE.PlaneGeometry(canvas1.width/2, canvas1.height/2),
        material1
      );
    mesh1.position.set(10,-20,8);
    scene.add(mesh1);

    
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