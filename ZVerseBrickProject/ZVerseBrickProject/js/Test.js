/*-----------------------------------------------------------------------------
Name: newBrickRendering.js
Description: This file contains all of the primary functions for rendering the
    brick polygon and its three lines of text on the side of the brick
Input Parameters: Strings of text are passed from BrickwithText.aspx
Output Parameters: No formal output, but there is a 3D window, polygon, and 
    text rendered on the screen for the user to view
-----------------------------------------------------------------------------*/

//VARIABLE DECLARATION SECTION/////////////////////////////////////////////////
var camera;
var scene;
var renderer;
var mesh;
var container = container = document.getElementById('canvas');

//Moving Text
var plane;
var controls;
var selection;
var offset = new THREE.Vector3();
var objects = [];
var raycaster = new THREE.Raycaster();

var group;
var group1;
var group2;
var group3;
var targetRotationX = 0;
var targetRotationOnMouseDownX = 0;
var targetRotationY = 0;
var targetRotationOnMouseDownY = 0;
var mouseXOnMouseDown = 0;
var mouseYOnMouseDown = 0;

var mouseX = 0;
var mouseY = 0;
var mouseXClick = 0;
var mouseYClick = 0;
var windowHalfX = container.offsetWidth / 2;
var windowHalfY = container.offsetHeight / 2;


/*
Variables to store the dynamic textures, geometries, and materials for the 
    three lines of text that will be rendered onto the brick
    Top line: text1, dynamicTexture, geometry1, material1
    Middle line: text2, dynamicTexture1, geometry2, material2
    Bottom line: text3, dynamicTexture2, geometry3, material3
*/
var text1 = '';
var text2 = '';
var text3 = '';

var dynamicTexture = new THREEx.DynamicTexture(512, 512);
var dynamicTexture1 = new THREEx.DynamicTexture(512, 512);
var dynamicTexture2 = new THREEx.DynamicTexture(512, 512);
var shadowing = new THREEx.DynamicTexture(512, 512);
var shadowing1 = new THREEx.DynamicTexture(512, 512);
var shadowing2 = new THREEx.DynamicTexture(512, 512);

var geometry1 = new THREE.CubeGeometry(4.9, 3, 3.1);
var geometry2 = new THREE.CubeGeometry(4.9, 3, 3.1);
var geometry3 = new THREE.CubeGeometry(4.9, 3, 3.1);
var shadowgeo = new THREE.CubeGeometry(4.9, 3, 3);
var shadowgeo1 = new THREE.CubeGeometry(4.9, 3, 3);
var shadowgeo2 = new THREE.CubeGeometry(4.9, 3, 3);

var material1 = new THREE.MeshBasicMaterial({
    map: dynamicTexture.texture
});
var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });
var shadowmaterial = new THREE.MeshBasicMaterial({ map: shadowing.texture });
var shadowmaterial1 = new THREE.MeshBasicMaterial({ map: shadowing1.texture });
var shadowmaterial2 = new THREE.MeshBasicMaterial({ map: shadowing2.texture });

//FUNCTION DECLARATION SECTION/////////////////////////////////////////////////
init();//initializing function uses to begin the 3D window
animate();//makes the brick actually work by calling render

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
    //set the primary parameters of the 3D window
    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(45, container.offsetWidth / container.offsetHeight, .01, 100);
    //camera.position.z = 10;

    //Addition for moving text 
    scene.add(camera);
    camera.position.set(0, 0, 10);
    camera.lookAt(new THREE.Vector3(0, 0, 0));

    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    // Plane, that helps to determinate an intersection position
    this.plane = new THREE.Mesh(new THREE.PlaneBufferGeometry(5, 5, 8, 8), new THREE.MeshBasicMaterial({ color: 0xffffff }));
    this.plane.visible = false;
    this.scene.add(this.plane);

    group = new THREE.Object3D();
    group1 = new THREE.Object3D();
    group2 = new THREE.Object3D();
    group3 = new THREE.Object3D();

    //load the brick model and texture
    var texture = new THREE.TextureLoader().load("js/brick.jpg");
    var geometry = new THREE.CubeGeometry(5, 3.1, 2.9); //width, height, depth
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    group.add(mesh);
    scene.add(group);

    //render the brick and text line textures
    renderer = new THREE.WebGLRenderer({ alpha: 1 });
    renderer.setSize(container.offsetWidth, container.offsetHeight);
    renderer.setClearColor(0xff0000, 0);

    container.appendChild(renderer.domElement);

    //var isDragging = false;
    //var previousMousePosition = {
    //    x: 0,
    //    y: 0
    //};
    //$(renderer.domElement).on('mousedown', function (e) {
    //    isDragging = true;
    //})
    //.on('mousemove', function (e) {
    //    //console.log(e);
    //    var deltaMove = {
    //        x: e.offsetX - previousMousePosition.x,
    //        y: e.offsetY - previousMousePosition.y
    //    };

    //    if (isDragging) {

    //        mouseX = (event.clientX - windowHalfX)/10;
    //        mouseY = (event.clientY - windowHalfY)/10;

    //    }

    //    previousMousePosition = {
    //        x: e.offsetX,
    //        y: e.offsetY
    //    };
    //});
    ///* */

    //$(document).on('mouseup', function (e) {
    //    isDragging = false;
    //});


    //bind window to event listeners
    container.addEventListener('mousemove', onDocumentMouseMove, false);
    container.addEventListener('mousedown', onDocumentMouseDown, false);
    container.addEventListener('touchstart', onDocumentTouchStart, false);
    container.addEventListener('touchmove', onDocumentTouchMove, false);
    container.addEventListener('mouseout', onDocumentMouseOut, false);
    container.addEventListener('resize', onWindowResize, false);

}


/*-----------------------------------------------------------------------------
Name: onDocumentMouseMove()
Description: This function tracks the mouse movement ans stores the output 
    into variables to be used in other functions
Input Parameters: Mouse cursor movement
Output Parameters:
    mouseX - the x coordinate of the cursor on the screen
    mouseY - the y coordinate of the cursor on the screen
-----------------------------------------------------------------------------*/
function onDocumentMouseMove(event) {
    mouseX = (event.clientX - windowHalfX) / 10;
    mouseY = (event.clientY - windowHalfY) / 10;
}
function onDocumentMouseOut(event) {
    mouseX = 0;
    mouseY = 0;
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


/*-----------------------------------------------------------------------------
Name: animate()
Description: TODO******************************************************************************************
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
Description: TODO******************************************************************************************
Input Parameters: this function has no input parameters
Output Parameters:
    This function has no output parameters
-----------------------------------------------------------------------------*/
function render() {
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


    //horizontal rotation   
    group1.rotation.y += (targetRotationX - group1.rotation.y) * 0.1;

    //vertical rotation 
    finalRotationY = (targetRotationY - group1.rotation.x);


    if (group1.rotation.x <= 1 && group1.rotation.x >= -1) {

        group1.rotation.x += finalRotationY * 0.1;
    }
    if (group1.rotation.x > 1) {

        group1.rotation.x = 1
    }
    else if (group1.rotation.x < -1) {

        group1.rotation.x = -1
    }



    //horizontal rotation   
    group2.rotation.y += (targetRotationX - group2.rotation.y) * 0.1;

    //vertical rotation 
    finalRotationY = (targetRotationY - group2.rotation.x);


    if (group2.rotation.x <= 1 && group2.rotation.x >= -1) {

        group2.rotation.x += finalRotationY * 0.1;
    }
    if (group2.rotation.x > 1) {

        group2.rotation.x = 1
    }
    else if (group2.rotation.x < -1) {

        group2.rotation.x = -1
    }


    //horizontal rotation   
    group3.rotation.y += (targetRotationX - group3.rotation.y) * 0.1;

    //vertical rotation 
    finalRotationY = (targetRotationY - group3.rotation.x);


    if (group3.rotation.x <= 1 && group3.rotation.x >= -1) {

        group3.rotation.x += finalRotationY * 0.1;
    }
    if (group3.rotation.x > 1) {

        group3.rotation.x = 1
    }
    else if (group3.rotation.x < -1) {

        group3.rotation.x = -1
    }

    renderer.render(scene, camera);

}


/*-----------------------------------------------------------------------------
Name: onWindowResize()
Description: TODO******************************************************************************************
Input Parameters:
Output Parameters:
-----------------------------------------------------------------------------*/
function onWindowResize() {
    windowHalfX = container.offsetWidth / 2;
    windowHalfY = container.offsetHeight / 2;
    camera.aspect = container.offsetWidth / container.offsetHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(container.offsetWidth, container.offsetHeight);
}



