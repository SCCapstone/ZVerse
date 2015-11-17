<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZVerseBrickProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
         <script src="~/js/three.min.js"></script>
    <script src="~/js/OBJLoader.js"></script>
    <script src="~/js/THREEx.WindowResize.js"></script>
    <script src="~/js/OrbitControls.js"></script>
    <script src="~/js/stats.min.js"></script>
    <script src="~/js/script1.js"></script>
    <script src="~/js/MTLLoader.js"></script>
    <script src="~/js/OBJMTLLoader.js"></script>

    <script type="text/javascript">
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

                // Prepare Camera 
                var VIEW_ANGLE = 45, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 1, FAR = 2000;
                this.camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
                this.scene.add(this.camera);
                this.camera.position.set(0, 100, 300);
                this.camera.lookAt(new THREE.Vector3(0, 0, 0));

                // Prepare Renderer
                this.renderer = new THREE.WebGLRenderer({ antialias: true });
                this.renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
                this.renderer.setClearColor(this.scene.fog.color);
                this.renderer.shadowMapEnabled = true;
                this.renderer.shadowMapSoft = true;

                // Prepare Container
                this.container = document.createElement('div');
                document.body.appendChild(this.container);
                this.container.appendChild(this.renderer.domElement);

                // Events
                THREEx.WindowResize(this.renderer, this.camera);

                // Prepare Controls (Orbit Controls)
                this.controls = new THREE.OrbitControls(this.ca, this.renderer.domElement);
                this.controls.target = new THREE.Vector3(0, 0, 0);
                this.controls.maxDistance = 2000;

                // Prepare Clock 
                this.clock = new THREE.Clock();

                // Prepare Stats
                this.stats = new Stats();
                this.stats.domElement.style.position = 'absolute';
                this.stats.domElement.style.left = '50px';
                this.stats.domElement.style.bottom = '50px';
                this.stats.domElement.style.zIndex = 1;
                this.container.appendChild(this.stats.domElement);

                // Add spot light
                var spLight = new THREE.SpotLight(0xffffff, 1.75, 2000, Math.PI / 3);
                spLight.castShadow = true;
                spLight.position.set(-100, 300, -50);
                this.scene.add(spLight);

                // Add Simple ground
                var ground = new THREE.Mesh(new THREE.PlaneGeometry(200, 200, 10, 10), new THREE.MeshLambertMaterial({ color: 0x999999 }));
                ground.receiveShadow = true;
                ground.position.set(0, 0, 0);
                ground.rotation.x = -Math.PI / 2;
                this.scene.add(ground);

                // Load a model
                this.loadModel();
            }, 
            loadModel: function () {
                
/*
                var oLoader = new THREE.OBJMTLLoader();
                oLoader.load('C:\ZVerse\AutoBrickProject\DecBrick.OBJ', 'C:\ZVerse\AutoBrickProject\DecBrick.mtl', function(object) {

                object.position.x = -200;
                    object.position.y = 0;
                    object.position.z = 100;
                    object.scale.set(0.1,0.1,0.1);
                    lesson6.scene.add(object);
                
                });
                */
            
                // Prepare loader and load the model
                var oLoader = new THREE.OBJMTLLoader();
                oLoader.load('C:\Users\Alexa\Downloads\DecBrick.OBJ', 'C:\Users\Alexa\Downloads\DecBrick.mtl', function (object) {
                    var material2 = new THREE.MeshLambertMaterial({ color: oxa65e00 });

                    object.traverse(function (child) {
                        if (child instanceof THREE.Mesh) {

                            // Apply custom material
                            child.material = material2;

                            // Enable casting shadows
                            child.castShadow = true;
                            child.receiveShadow = true;

                        }

                    });

                    object.position.x = 0;
                    object.position.y = 0;
                    object.position.z = 0;
                    object.scale.set(.285714, .285714, .285714);
                    lesson6.scene.add(object);

                });
            }

            
        };
        
        // Animate the Scene
        function  animate() {
            requestAnimationFrame(animate);
            render();
            update();
        }
        
        // Update controls and stats

        function update() {
            lesson6.controls.update(lessong6.clock.getDelta());
            lesson6.stats.update();
        }

        // Render the scene
        function render() {
            if (lesson6.renderer) {
                lesson6.renderer.render(lessong6.scene, lesson6.camera);
            }
        }

        // Initialize lesson on page load
        function initializeLesson() {
            lesson6.init();
            animate();
        }

        if (window.addEventListener)
            window.addEventListener('laod', initializeLesson, false);
        else if (window.attachEvent)
            window.attachEvent('onload', initializeLesson);
        else windowonload = initializeLesson;

      
    </script>
  
    </div>

