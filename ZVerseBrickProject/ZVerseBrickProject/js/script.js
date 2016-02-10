/**
 *
 * WebGL With Three.js - Lesson 6 - loading models
 * http://www.script-tutorials.com/webgl-with-three-js-lesson-6/
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014, Script Tutorials
 * http://www.script-tutorials.com/
 */

var lesson6 = {
    scene: null,
    camera: null,
    renderer: null,
    container: null,
    controls: null,
    clock: null,
    stats: null,

    init: function () { // Initialization

        // create main scene
        this.scene = new THREE.Scene();
        this.scene.fog = new THREE.FogExp2(0xcce0ff, 0.0003);

        var SCREEN_WIDTH = window.innerWidth,
            SCREEN_HEIGHT = window.innerHeight;

        //var SCREEN_WIDTH = 50,
          //  SCREEN_HEIGHT = 50;

        // prepare camera
        var VIEW_ANGLE = 25, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 1, FAR = 2000;
        this.camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
        this.scene.add(this.camera);
        this.camera.position.set(0, 100, 300);
        this.camera.lookAt(new THREE.Vector3(0, 0, 0));

        // prepare renderer
        this.renderer = new THREE.WebGLRenderer({ antialias: true });
        this.renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
        this.renderer.setClearColor(this.scene.fog.color);
        this.renderer.shadowMapEnabled = true;
        this.renderer.shadowMapSoft = true;

        // prepare container
        this.container = document.createElement('div');
        document.body.appendChild(this.container);
        this.container.appendChild(this.renderer.domElement);

        // events
        THREEx.WindowResize(this.renderer, this.camera);

        // prepare controls (OrbitControls)
        this.controls = new THREE.OrbitControls(this.camera, this.renderer.domElement);
        this.controls.target = new THREE.Vector3(0, 0, 0);
        this.controls.maxDistance = 20;

        // prepare clock
        this.clock = new THREE.Clock();

        // prepare stats
        this.stats = new Stats();
        this.stats.domElement.style.position = 'absolute';
        this.stats.domElement.style.left = '50px';
        this.stats.domElement.style.bottom = '50px';
        this.stats.domElement.style.zIndex = 1;
        this.container.appendChild(this.stats.domElement);
        

        //LIGHTS

        var hemiLight = new THREE.HemisphereLight(0xffffff, 0xffffff, 0.6);
        hemiLight.color.setHSL(0.6, 1, 0.6);
        hemiLight.position.set(0, 500, 0);
        this.scene.add(hemiLight);

        // add directional light
        var dLight = new THREE.DirectionalLight(0xffffff, 1);
        dLight.color.setHSL(0.1, 1, 0.95);
        dLight.position.set(-1, 1.75, 1);
        dLight.position.multiplyScalar(50);
        //dLight.castShadow = true;
        //dLight.shadowCameraVisible = true;
        //dLight.shadowDarkness = 0.2;
        //dLight.shadowMapWidth = dLight.shadowMapHeight = 1000;
        this.scene.add(dLight);

        dLight.castShadow = true;

        dLight.shadowMapWidth = 2048;
        dLight.shadowMapHeight = 2048;

        var d = 50;
        dLight.shadowCameraLeft = -d;
        dLight.shadowCameraRight = d;
        dLight.shadowCameraTop = d;
        dLight.shadowCameraBottom = -d;

        dLight.shadowCameraFar = 3500;
        dLight.shadowBias = -0.0001;


        // add particle of light
        //particleLight = new THREE.Mesh(new THREE.SphereGeometry(10, 10, 10), new THREE.MeshBasicMaterial({ color: 0x44ff44 }));
        //particleLight.position = dLight.position;
        //this.scene.add(particleLight);


        // add spot light
        var spLight = new THREE.SpotLight(0xffffff, 1.75, 2000, Math.PI / 3);
        spLight.castShadow = true;
        spLight.position.set(-10, 300, -50);
        this.scene.add(spLight);

        // add simple ground
        //var ground = new THREE.Mesh(new THREE.PlaneGeometry(200, 200, 10, 10), new THREE.MeshLambertMaterial({ color: 0x999999 }));
        //ground.receiveShadow = true;
        //ground.position.set(0, 0, 0);
        //ground.rotation.x = -Math.PI / 2;
        //this.scene.add(ground);

        // load a model
        this.loadModel();
    },
    loadModel: function () {

        // prepare loader and load the model
        var oLoader = new THREE.OBJLoader();
        oLoader.load('DecBrick.obj', function (object, materials) {

            // var material = new THREE.MeshFaceMaterial(materials);
            var material2 = new THREE.MeshLambertMaterial({ color: 0xffffff, map: THREE.ImageUtils.loadTexture('bricks.jpg') });

            object.traverse(function (child) {
                if (child instanceof THREE.Mesh) {

                    // apply custom material
                    child.material = material2;

                    // enable casting shadows
                    child.castShadow = true;
                    child.receiveShadow = true;
                }
            });

            object.position.x = 0;
            object.position.y = 0;
            object.position.z = 0;
            object.scale.set(1, 1, 1);
            lesson6.scene.add(object);
            });

        //var loader = new THREE.OBJMTLLoader();
        //loader.load('DecBrick.obj', 'DecBrick.mtl', function(object){
        //    object.position.y = 0;
        //    lesson6.scene.add(object);
        //}, onprogress, onerror);

    }
};

// Animate the scene
function animate() {
    requestAnimationFrame(animate);
    render();
    update();
}

// Update controls and stats
function update() {
    lesson6.controls.update(lesson6.clock.getDelta());
    lesson6.stats.update();
}

// Render the scene
function render() {
    if (lesson6.renderer) {
        lesson6.renderer.render(lesson6.scene, lesson6.camera);
    }
}

// Initialize lesson on page load
function initializeLesson() {
    lesson6.init();
    animate();
}

if (window.addEventListener)
    window.addEventListener('load', initializeLesson, false);
else if (window.attachEvent)
    window.attachEvent('onload', initializeLesson);
else window.onload = initializeLesson;

