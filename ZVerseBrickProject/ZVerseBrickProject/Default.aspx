﻿ <!DOCTYPE html>
<html lang="en">
	<head>
		<title>ship_triangle OBJloader</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<style>
			body {
				font-family: Monospace;
				background-color: #000;
				color: #fff;
				margin: 0px;
				overflow: hidden;
			}
			#info {
				color: #fff;
				position: absolute;
				top: 10px;
				width: 100%;
				text-align: center;
				z-index: 100;
				display:block;
			}
			#info a, .button { color: #f00; font-weight: bold; text-decoration: underline; cursor: pointer }
		</style>
	</head>

	<body>
		<div id="info">
            OBJ loader
		</div>

		<script src="http://threejs.org/build/three.min.js"></script>
		<script src="http://threejs.org/examples/js/loaders/OBJLoader.js"></script>

		<script src="http://threejs.org/examples/js/Detector.js"></script>
		<script src="http://threejs.org/examples/js/libs/stats.min.js"></script>

		<script>
            var clock = new THREE.Clock();
            var delta = clock.getDelta(); // seconds.
            var rotateAngle = Math.PI / 2 * delta;   // pi/2 radians (90 degrees) per second
			var container, stats;

			var camera, scene, renderer;

			var mouseX = 0, mouseY = 0;

			var windowHalfX = window.innerWidth / 2;
			var windowHalfY = window.innerHeight / 2;


			init();
			animate();


			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 2000 );
				camera.position.z = 2;

				// scene

				scene = new THREE.Scene();

				var ambient = new THREE.AmbientLight( 0x101030 );
				scene.add( ambient );

				var directionalLight = new THREE.DirectionalLight( 0xffeedd );
				directionalLight.position.set( 0, 0, 1 );
				scene.add( directionalLight );

				// texture

				var manager = new THREE.LoadingManager();
				manager.onProgress = function ( item, loaded, total ) {

					console.log( item, loaded, total );

				};

				// model
				var loader = new THREE.OBJLoader( manager );
				loader.load('C:\Users\Alexa\Downloads\DecBrick.obj', function (object) {

					object.traverse( function ( child ) {

						if ( child instanceof THREE.Mesh ) {

							//child.material.map = texture;

						}

					} );

					object.position.x = -80;
                    object.rotation.x = 20* Math.PI / 180;
                    object.rotation.z = 20* Math.PI / 180;
                    object.scale.x = 30;
                    object.scale.y = 30;
                    object.scale.z = 30;
                    obj = object
					scene.add( obj );

				} );

				renderer = new THREE.WebGLRenderer();
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				document.addEventListener( 'mousemove', onDocumentMouseMove, false );

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {
				windowHalfX = window.innerWidth / 2;
				windowHalfY = window.innerHeight / 2;

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );
			}

			function onDocumentMouseMove( event ) {
				mouseX = ( event.clientX - windowHalfX ) / 2;
				mouseY = ( event.clientY - windowHalfY ) / 2;
			}

			function animate() {
				requestAnimationFrame( animate );
				render();
			}

			function render() {
                obj.rotation.x += (0.2*(Math.PI / 180));
                obj.rotation.x %=360;

				camera.position.x += ( mouseX - camera.position.x ) * .05;
				camera.position.y += ( - mouseY - camera.position.y ) * .05;

				camera.lookAt( scene.position );

				renderer.render( scene, camera );
			}
		</script>
	</body>
</html>

