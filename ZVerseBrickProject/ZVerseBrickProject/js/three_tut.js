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
    camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, .01, 100);
    camera.position.z = 10;

    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    var texture = new THREE.TextureLoader().load("brick.jpg");
    var geometry = new THREE.CubeGeometry(5,3.1,2.9); //width, height, depth
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    var text1 = 'hello';
    var text2 = 'its me';
    var text3 = '-Alexa';

    var dynamicTexture = new THREEx.DynamicTexture(512, 512);
    dynamicTexture.context.font = "bolder 80px Verdana";
    dynamicTexture.drawText(text1, undefined, 100, 'black');
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
    dynamicTexture1.drawText(text2, undefined, 240, 'black');
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
    dynamicTexture2.drawText(text3, undefined, 380, 'black');
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

    //// create a canvas element
    //var canvas1 = document.createElement('canvas');
    //var context1 = canvas1.getContext('2d');
    //context1.font = "Bold 30px Arial";
    //context1.fillStyle = "rgba(255,0,0,0.95)";
    //context1.fillText('Alexa', 0, 20);

    //// canvas contents will be used for a texture
    //var texture1 = new THREE.Texture(canvas1)
    //texture1.needsUpdate = true;

    //var material1 = new THREE.MeshBasicMaterial({ map: texture1 });
    //material1.transparent = true;
    //var mesh1 = new THREE.Mesh(
    //    new THREE.PlaneGeometry(canvas1.width/2, canvas1.height/2),
    //    material1
    //  );
    //mesh1.position.set(10,-20,8);
    //scene.add(mesh1);

    
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