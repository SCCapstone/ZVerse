//var container;
var container = container = document.getElementById('canvas');

var camera, scene, renderer;

var mouseX = 0, mouseY = 0;

//var windowHalfX = window.innerWidth / 2;
//var windowHalfY = window.innerHeight / 2;
var windowHalfX = container.offsetWidth / 2;
var windowHalfY = container.offsetHeight / 2;


init();
animate();


function init() {

    //container = document.createElement('div');
    //document.body.appendChild(container);

    //camera = new THREE.PerspectiveCamera(15, (window.innerWidth / 2) / (window.innerHeight / 2), 1, 2000);
    camera = new THREE.PerspectiveCamera(15, container.offsetWidth / container.offsetHeight, .01, 100);
    camera.position.set(0, 10, 30);

    // scene

    scene = new THREE.Scene();

    var ambient = new THREE.AmbientLight(0x101030);
    scene.add(ambient);

    var directionalLight = new THREE.DirectionalLight(0xffffff);
    directionalLight.position.set(0, 1, 1).normalize();
    scene.add(directionalLight);

    // texture

    var manager = new THREE.LoadingManager();
    manager.onProgress = function (item, loaded, total) {

        console.log(item, loaded, total);

    };

    var texture = new THREE.Texture();

    var onProgress = function (xhr) {
        if (xhr.lengthComputable) {
            var percentComplete = xhr.loaded / xhr.total * 100;
            console.log(Math.round(percentComplete, 2) + '% downloaded');
        }
    };

    var onError = function (xhr) {
    };


    var loader = new THREE.ImageLoader(manager);
    loader.load('js/brickTexture.jpg', function (image) {

        texture.image = image;
        texture.needsUpdate = true;

    });

    // model

    var loader = new THREE.OBJLoader(manager);
    loader.load('js/DecBrick.obj', function (object) {

        object.traverse(function (child) {

            if (child instanceof THREE.Mesh) {

                child.material.map = texture;

            }

        });

        //object.position.y = - 95;
        scene.add(object);

    }, onProgress, onError);

    //

    renderer = new THREE.WebGLRenderer({ alpha: 1 });
    //renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setPixelRatio(container.devicePixelRatio);
    //renderer.setSize((window.innerWidth / 2), (window.innerHeight / 2));
    renderer.setSize(container.offsetWidth, container.offsetHeight);
    renderer.setClearColor(0xff0000, 0);

    container.appendChild(renderer.domElement);

    //document.addEventListener('mousemove', onDocumentMouseMove, false);

    container.addEventListener('mousemove', onDocumentMouseMove, false);

    //window.addEventListener('resize', onWindowResize, false);

    container.addEventListener('resize', onWindowResize, false);

}


function onWindowResize() {

    //windowHalfX = window.innerWidth / 2;
    //windowHalfY = window.innerHeight / 2;
    windowHalfX = container.offsetWidth / 2;
    windowHalfY = container.offsetHeight / 2;


    //camera.aspect = (window.innerWidth / 2) / (window.innerHeight / 2);

    camera.aspect = container.offsetWidth / container.offsetHeight;
    camera.updateProjectionMatrix();

    //renderer.setSize((window.innerWidth / 2), (window.innerHeight / 2));
    renderer.setSize(container.offsetWidth, container.offsetHeight);

}


function onDocumentMouseMove(event) {

    mouseX = (event.clientX - windowHalfX) / 2;
    mouseY = (event.clientY - windowHalfY) / 2;

}

//

function animate() {

    requestAnimationFrame(animate);
    render();

}

function render() {

    camera.position.x += (mouseX - camera.position.x) * .05;
    camera.position.y += (-mouseY - camera.position.y) * .05;

    camera.lookAt(scene.position);

    renderer.render(scene, camera);

}