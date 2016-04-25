/*-----------------------------------------------------------------------------
Name: objMtlBrick.js
Description: This file contains all of the primary functions for rendering the
    obj file which untimately loads a sample brick on the Website. 

Input Parameters: 
Output Parameters: No formal output, but there is a 3D window, 3d Brick
-----------------------------------------------------------------------------*/
//VARIABLE DECLARATION SECTION/////////////////////////////////////////////////

var container = container = document.getElementById('canvas');

var camera, scene, renderer;

var mouseX = 0, mouseY = 0;

var windowHalfX = container.offsetWidth / 2;
var windowHalfY = container.offsetHeight / 2;


var group;
var targetRotationX = 0;
var targetRotationOnMouseDownX = 0;
var targetRotationY = 0;
var targetRotationOnMouseDownY = 0;
var mouseXOnMouseDown = 0;
var mouseYOnMouseDown = 0;

var zoomMax = 3.4; // the closest in you can go
var zoomMin = 20; // the farthest out you can go
var zoomSpeed = 0.1; // how much movement on scroll wheel

//FUNCTION DECLARATION SECTION/////////////////////////////////////////////////
init(); //initializing function uses to begin the 3D window
animate(); //makes the brick actually work by loading obj file

/*-----------------------------------------------------------------------------
Name: init()
Description: The init function is called on the initial loading of the view. 
    It begins the 3D window so that the brick can be rendered inside the window
Input Parameters: This function has no input parameters. It is started on the 
    loading of the view
Output Parameters: This function has no formal output, but it does begin the 
    3D window to render the brick and text lines
-----------------------------------------------------------------------------*/

function init() {

    //Setting the camera view for te object
    camera = new THREE.PerspectiveCamera(45, container.offsetWidth / container.offsetHeight, .01, 100);
    //camera.position.set(0, 10, 30);
    camera.position.z = 10;


    //Creating a Scene for the object
    scene = new THREE.Scene();

    group = new THREE.Object3D();

    //Adding ambient light to the scene 
    var ambient = new THREE.AmbientLight(0x101030);
    scene.add(ambient);

    //Adding directional light to the scene 
    var directionalLight = new THREE.DirectionalLight(0xffdead, 1);
    directionalLight.position.set(1, 1, 1).normalize();
    scene.add(directionalLight);

    // texture
    //Progress check on downloading the files
    var manager = new THREE.LoadingManager();
    manager.onProgress = function (item, loaded, total) {

        console.log(item, loaded, total);

    };

    var texture = new THREE.Texture();

    //Checking progress on downloading texture and obj file 
    var onProgress = function (xhr) {
        if (xhr.lengthComputable) {
            var percentComplete = xhr.loaded / xhr.total * 100;
            console.log(Math.round(percentComplete, 2) + '% downloaded');
        }
    };

    var onError = function (xhr) {
    };

    //Loading in the texture image for the obj file 
    var loader = new THREE.ImageLoader(manager);
    loader.load('js/brickTexture.jpg', function (image) {

        texture.image = image;
        texture.needsUpdate = true;

    });

    // model
    //Loading in the OBJ file to load the brick 
    var loader = new THREE.OBJLoader(manager);
    loader.load('js/DecBrick.obj', function (object) {

        object.traverse(function (child) {

            if (child instanceof THREE.Mesh) {

                child.material.map = texture;

            }

        });

        //object.position.y = - 95;
        group.add(object);
        scene.add(group);
        //scene.add(object);


    }, onProgress, onError);

    //

    renderer = new THREE.WebGLRenderer({ alpha: 1 });
    renderer.setPixelRatio(container.devicePixelRatio);
    renderer.setSize(container.offsetWidth, container.offsetHeight);
    renderer.setClearColor(0xff0000, 0);

    container.appendChild(renderer.domElement);

    //container.addEventListener('mousemove', onDocumentMouseMove, false);

    //////////////////////////////////////////////////////////////////////
    
    container.addEventListener('mousedown', onDocumentMouseDown, false);
    container.addEventListener('touchstart', onDocumentTouchStart, false);
    container.addEventListener('touchmove', onDocumentTouchMove, false);
    container.addEventListener("mousewheel", onDocumentMouseWheel, false);
    container.addEventListener('mouseout', onDocumentMouseOut, false);
    container.addEventListener('resize', onWindowResize, false);


    //////////////////////////////////////////////////////////////////////


    container.addEventListener('resize', onWindowResize, false);

}


////////////////////////////////////////////////////////////////////////////

function onDocumentMouseOut(event) {
    mouseX = 0;
    mouseY = 0;
    //camera.position.z = 10;
}

function onDocumentMouseWheel(event) {
    //console.log(event.wheelDeltaY);
    if (event.wheelDeltaY > 0 && camera.position.z > zoomMax) //zoom in
    {
        camera.position.z = camera.position.z - zoomSpeed;
    }
    if (event.wheelDeltaY < 0 && camera.position.z < zoomMin) //zoom out
    {
        camera.position.z = camera.position.z + zoomSpeed;
    }
}

function onDocumentMouseDown(event) {

    event.preventDefault();

    document.addEventListener('mousemove', onDocumentMouseMove, false);
    document.addEventListener('mouseup', onDocumentMouseUp, false);
    document.addEventListener('mouseout', onDocumentMouseOut, false);

    mouseXOnMouseDown = event.clientX - windowHalfX;
    targetRotationOnMouseDownX = targetRotationX;

    mouseYOnMouseDown = event.clientY - windowHalfY;
    targetRotationOnMouseDownY = targetRotationY;
}

function onDocumentMouseMove(event) {
    mouseX = event.clientX - windowHalfX;
    mouseY = event.clientY - windowHalfY;

    targetRotationY = targetRotationOnMouseDownY + (mouseY - mouseYOnMouseDown) * 0.02;
    targetRotationX = targetRotationOnMouseDownX + (mouseX - mouseXOnMouseDown) * 0.02;
}

function onDocumentMouseUp(event) {
    document.removeEventListener('mousemove', onDocumentMouseMove, false);
    document.removeEventListener('mouseup', onDocumentMouseUp, false);
    document.removeEventListener('mouseout', onDocumentMouseOut, false);
}

function onDocumentTouchStart(event) {

    if (event.touches.length == 1) {

        event.preventDefault();

        mouseXOnMouseDown = event.touches[0].pageX - windowHalfX;
        targetRotationOnMouseDownX = targetRotationX;

        mouseYOnMouseDown = event.touches[0].pageY - windowHalfY;
        targetRotationOnMouseDownY = targetRotationY;
    }

}

function onDocumentTouchMove(event) {

    if (event.touches.length == 1) {

        event.preventDefault();

        mouseX = event.touches[0].pageX - windowHalfX;
        targetRotationX = targetRotationOnMouseDownX + (mouseX - mouseXOnMouseDown) * 0.05;

        mouseY = event.touches[0].pageY - windowHalfY;
        targetRotationY = targetRotationOnMouseDownY + (mouseY - mouseYOnMouseDown) * 0.05;
    }
}



////////////////////////////////////////////////////////////////////////////


function onWindowResize() {

    windowHalfX = container.offsetWidth / 2;
    windowHalfY = container.offsetHeight / 2;

    camera.aspect = container.offsetWidth / container.offsetHeight;
    camera.updateProjectionMatrix();

    renderer.setSize(container.offsetWidth, container.offsetHeight);

}


//function onDocumentMouseMove(event) {

//    mouseX = (event.clientX - windowHalfX) / 2;
//    mouseY = (event.clientY - windowHalfY) / 2;

//}

/*-----------------------------------------------------------------------------
Name: animate()
Description: 
Input Parameters: This function has no input parameters
Output Parameters:
    The 3D window to render the brick in
-----------------------------------------------------------------------------*/

function animate() {

    requestAnimationFrame(animate);
    render();

}

/*-----------------------------------------------------------------------------
Name: render()
Description: 
Input Parameters: this function has no input parameters
Output Parameters:
    This function has no output parameters
-----------------------------------------------------------------------------*/

function render() {

    //camera.position.x += (mouseX - camera.position.x) * .05;
    //camera.position.y += (-mouseY - camera.position.y) * .05;
    //horizontal rotation   
    group.rotation.y += (targetRotationX - group.rotation.y) * 0.1;

    //vertical rotation 
    finalRotationY = (targetRotationY - group.rotation.x);

    if (group.rotation.x <= 1 && group.rotation.x >= -1) {
        group.rotation.x += finalRotationY * 0.1;
    }
    if (group.rotation.x > 1) {
        group.rotation.x = 1
    }
    else if (group.rotation.x < -1) {
        group.rotation.x = -1
    }


    camera.lookAt(scene.position);

    renderer.render(scene, camera);

}