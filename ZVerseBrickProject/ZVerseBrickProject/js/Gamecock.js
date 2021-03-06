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

var group;
var group1;
var group2;
var group3;
var group4;
var targetRotationX = 0;
var targetRotationOnMouseDownX = 0;
var targetRotationY = 0;
var targetRotationOnMouseDownY = 0;
var mouseXOnMouseDown = 0;
var mouseYOnMouseDown = 0;

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

var dynamicTexture1 = new THREEx.DynamicTexture(512, 512);
var dynamicTexture2 = new THREEx.DynamicTexture(512, 512);
var dynamicTexture3 = new THREEx.DynamicTexture(512, 512);

var geometry1 = new THREE.CubeGeometry(6.1, 6.1, 6.2);
var geometry2 = new THREE.CubeGeometry(6.1, 6.1, 6.2);
var geometry3 = new THREE.CubeGeometry(6.1, 6.1, 6.2);


var material1 = new THREE.MeshBasicMaterial({ map: dynamicTexture1.texture });
var material2 = new THREE.MeshBasicMaterial({ map: dynamicTexture2.texture });
var material3 = new THREE.MeshBasicMaterial({ map: dynamicTexture3.texture });


var zoomMax = 5.3; // the closest in you can go
var zoomMin = 20; // the farthest out you can go
var zoomSpeed = 0.1; // how much movement on scroll wheel

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
    camera.position.z = 15;
    var light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 1, 1).normalize();
    scene.add(light);

    group = new THREE.Object3D();
    group1 = new THREE.Object3D();
    group2 = new THREE.Object3D();
    group3 = new THREE.Object3D();
    group4 = new THREE.Object3D();

    //load the brick model and texture
    var texture = new THREE.TextureLoader().load("js/GamecockCube.jpg");
    var geometry = new THREE.CubeGeometry(6, 6, 6); //width, height, depth
    var material = new THREE.MeshBasicMaterial({ map: texture });
    mesh = new THREE.Mesh(geometry, material);
    group.add(mesh);
    scene.add(group);

    //add "University of South Carolina" to the surface of the brick
    var dynamicTexture4 = new THREEx.DynamicTexture(512, 512);
    dynamicTexture4.context.font = "25px Verdana";
    dynamicTexture4.drawText("University of South Carolina", undefined, 500, 'white');
    var geometry4 = new THREE.CubeGeometry(6.1, 6.1, 6.1);
    var material4 = new THREE.MeshBasicMaterial({ map: dynamicTexture4.texture });
    material4.transparent = true;
    material4.polygonOffset = true;
    material4.polygonOffsetFactor = -0.2;
    mesh4 = new THREE.Mesh(geometry4, material4);
    group4.add(mesh4);
    scene.add(group4);

    //render the brick and text line textures
    renderer = new THREE.WebGLRenderer({ alpha: 1 });
    renderer.setSize(container.offsetWidth, container.offsetHeight);
    renderer.setClearColor(0xff0000, 0);

    container.appendChild(renderer.domElement);

    //bind window to event listeners
    container.addEventListener('mousedown', onDocumentMouseDown, false);
    container.addEventListener('touchstart', onDocumentTouchStart, false);
    container.addEventListener('touchmove', onDocumentTouchMove, false);
    container.addEventListener("mousewheel", onDocumentMouseWheel, false);
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

function onDocumentMouseOut(event) {
    mouseX = 0;
    mouseY = 0;
    //camera.position.z = 10;
}

function onDocumentMouseWheel(event) {
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

    //horizontal rotation   
    group4.rotation.y += (targetRotationX - group4.rotation.y) * 0.1;

    //vertical rotation 
    finalRotationY = (targetRotationY - group4.rotation.x);


    if (group4.rotation.x <= 1 && group4.rotation.x >= -1) {

        group4.rotation.x += finalRotationY * 0.1;
    }
    if (group4.rotation.x > 1) {

        group4.rotation.x = 1
    }
    else if (group4.rotation.x < -1) {

        group4.rotation.x = -1
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


/*-----------------------------------------------------------------------------
Name: createText()
Description: This function creates the baseline for three text inputs. 
             it specifies the color and size of the text as well. 
Input Parameters: Attributes (attrs) - any characteristics that goes with the text lines
Output Parameters:
-----------------------------------------------------------------------------*/

function createText(attrs) {
    var answer = "\"" + attrs.answer + "\"";
    attrs.texture.clear();
    attrs.texture.context.font = "bolder 58px " + answer;
    attrs.texture.drawText(attrs.obj, undefined, $("#" + attrs.id).val(), '#707070');
    attrs.texture.context.font = "60px " + answer;
    attrs.texture.drawText(attrs.obj, undefined, $("#" + attrs.id).val(), 'black');
}

/*-----------------------------------------------------------------------------
Name: createBinder()
Description: Binding the text to the polygons as well as putting the text lines inside
             the groups. 
Input Parameters: Attributes (attrs) - any characteristics that goes with the text lines
Output Parameters:
-----------------------------------------------------------------------------*/

function createBinder(attrs) {
    attrs.material.transparent = true;
    attrs.material.polygonOffset = true;
    attrs.material.polygonOffsetFactor = -0.2;
    attrs.group.add(new THREE.Mesh(attrs.geometry, attrs.material));
    scene.add(attrs.group);
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

function getText1(text, answer) {
    createText({ obj: text, answer: answer, id: 'textSlider1', texture: dynamicTexture1 })
    createBinder({ material: material1, geometry: geometry1, group: group1 })

    $("#textSlider1").on("input change", function () {
        console.log('textSlider1 changed to ', $("#textSlider1").val())
        createText({ obj: text, answer: answer, id: 'textSlider1', texture: dynamicTexture1 })
    });
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


function getText2(text, answer) {
    createText({ obj: text, answer: answer, id: 'textSlider2', texture: dynamicTexture2 })
    createBinder({ material: material2, geometry: geometry2, group: group2 })

    $("#textSlider2").on("input change", function () {
        console.log('textSlider2 changed to ', $("#textSlider2").val())
        createText({ obj: text, answer: answer, id: 'textSlider2', texture: dynamicTexture2 })
    });
}

/*-----------------------------------------------------------------------------
Name: getText3()
Description: This function takes in text renders it onto the polygon on the 
    middle line of the three lines of text
Input Parameters:
    text: String of text to be rendered onto the polygon
Output Parameters: No formal output, but this function renders text onto the 
    polygon on the middle line
-----------------------------------------------------------------------------*/


function getText3(text, answer) {
    createText({ obj: text, answer: answer, id: 'textSlider3', texture: dynamicTexture3 })
    createBinder({ material: material3, geometry: geometry3, group: group3 })

    $("#textSlider3").on("input change", function () {
        console.log('textSlider3 changed to ', $("#textSlider3").val())
        createText({ obj: text, answer: answer, id: 'textSlider3', texture: dynamicTexture3 })
    });
}