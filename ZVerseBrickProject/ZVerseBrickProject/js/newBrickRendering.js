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
var mouseX = 0;
var mouseY = 0;
var container = container = document.getElementById('canvas');
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
var geometry1 = new THREE.CubeGeometry(4.9, 3, 3);
var geometry2 = new THREE.CubeGeometry(4.9, 3, 3);
var geometry3 = new THREE.CubeGeometry(4.9, 3, 3);
var material1 = new THREE.MeshBasicMaterial({ map: dynamicTexture.texture });
var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });

//FUNCTION DECLARATION SECTION/////////////////////////////////////////////////
init();//initializing function uses to begin the 3D window
animate();//TODO******************************************************************************************

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
    camera.position.z = 10;
    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    //load the brick model and texture
    var texture = new THREE.TextureLoader().load("js/brick.jpg");
    var geometry = new THREE.CubeGeometry(5, 3.1, 2.9); //width, height, depth
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);

    //initialize the texture for the first line of text
    var dynamicTexture = new THREEx.DynamicTexture(512, 512);
    dynamicTexture.context.font = "bolder 80px Verdana";
    dynamicTexture.drawText(text1, undefined, 140, 'black');
    var geometry1 = new THREE.CubeGeometry(4.9, 3, 3);
    var material1 = new THREE.MeshBasicMaterial({ map: dynamicTexture.texture });
    material1.transparent = true;
    material1.polygonOffset = true;
    material1.polygonOffsetFactor = -0.2;
    mesh1 = new THREE.Mesh(geometry1, material1);
    scene.add(mesh1);

    //initialize the texture for the second line of text
    var dynamicTexture1 = new THREEx.DynamicTexture(512, 512);
    dynamicTexture1.context.font = "bolder 80px Verdana";
    dynamicTexture1.drawText(text2, undefined, 280, 'black');
    var geometry2 = new THREE.CubeGeometry(4.9, 3, 3);
    var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
    material2.transparent = true;
    material2.polygonOffset = true;
    material2.polygonOffsetFactor = -0.2;
    mesh2 = new THREE.Mesh(geometry2, material2);
    scene.add(mesh2);

    //initialize the texture for the third line of text
    var dynamicTexture2 = new THREEx.DynamicTexture(512, 512);
    dynamicTexture2.context.font = "bolder 80px Verdana";
    dynamicTexture2.drawText(text3, undefined, 420, 'black');
    var geometry3 = new THREE.CubeGeometry(4.9, 3, 3);
    var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });
    material3.transparent = true;
    material3.polygonOffset = true;
    material3.polygonOffsetFactor = -0.2;
    mesh3 = new THREE.Mesh(geometry3, material3);
    scene.add(mesh3);

    //render the brick and text line textures
    renderer = new THREE.WebGLRenderer({alpha: 1});
    renderer.setSize(container.offsetWidth, container.offsetHeight);
    renderer.setClearColor(0xff0000, 0);

container.appendChild(renderer.domElement);

    //bind window to event listeners
    container.addEventListener('mousemove', onDocumentMouseMove, false);
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
    camera.position.x += (mouseX - camera.position.x) * .4;
    camera.position.y += (-mouseY - camera.position.y) * .4;
    camera.lookAt(scene.position);
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


/*-----------------------------------------------------------------------------
Name: getText1()
Description: This function takes in text renders it onto the polygon on the top
    line of the three lines of text
Input Parameters:
    text: String of text to be rendered onto the polygon
Output Parameters: No formal output, but this function renders text onto the 
    polygon on the top line
-----------------------------------------------------------------------------*/
function getText1(text) {
    text1 = text;
    dynamicTexture.clear();
    dynamicTexture.context.font = "60px Verdana";
    dynamicTexture.drawText(text1, undefined, 140, 'black');
    material1.transparent = true;
    material1.polygonOffset = true;
    material1.polygonOffsetFactor = -0.2;
    mesh1 = new THREE.Mesh(geometry1, material1);
    scene.add(mesh1);
    
}


/*-----------------------------------------------------------------------------
Name: getText2()
Description: This function takes in text renders it onto the polygon on the 
    middle line of the three lines of text
Input Parameters:
    text: String of text to be rendered onto the polygon
Output Parameters: No formal output, but this function renders text onto the 
    polygon on the middle line
-----------------------------------------------------------------------------*/
function getText2(text) {
    text2 = text;
    dynamicTexture1.clear();
    dynamicTexture1.context.font = "60px Verdana";
    dynamicTexture1.drawText(text2, undefined, 280, 'black');
    material2.transparent = true;
    material2.polygonOffset = true;
    material2.polygonOffsetFactor = -0.2;
    mesh2 = new THREE.Mesh(geometry2, material2);
    scene.add(mesh2);
}


/*-----------------------------------------------------------------------------
Name: getText3()
Description: This function takes in text renders it onto the polygon on the 
    bottom line of the three lines of text
Input Parameters:
    text: String of text to be rendered onto the polygon
Output Parameters: No formal output, but this function renders text onto the 
    polygon on the bottom line
-----------------------------------------------------------------------------*/
function getText3(text) {
    text3 = text;
    dynamicTexture2.clear();
    dynamicTexture2.context.font = "60px Verdana";
    dynamicTexture2.drawText(text3, undefined, 420, 'black');
    material3.transparent = true;
    material3.polygonOffset = true;
    material3.polygonOffsetFactor = -0.2;
    mesh3 = new THREE.Mesh(geometry3, material3);
    scene.add(mesh3);
}