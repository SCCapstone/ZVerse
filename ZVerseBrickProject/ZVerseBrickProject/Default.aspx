﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZVerseBrickProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <!doctype html>
<html lang="en">
    <head>
        <title>three.js webgl - loaders - OBJ loader</title>
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
        <a href="http://github.com/mrdoob/three.js" target="_blank">three.js</a> - OBJLoader test
        </div>

        <script src="javascripts/Three.js"></script>
        <script src="javascripts/OBJLoader.js"></script>

        <script src="javascripts/Detector.js"></script>
        <script src="javascripts/Stats.js"></script>

        <script>

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

                scene = new THREE.Scene();

                camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 2000 );
                camera.position.z = 100;
                scene.add( camera );

                var ambient = new THREE.AmbientLight( 0x101030 );
                scene.add( ambient );

                var directionalLight = new THREE.DirectionalLight( 0xffeedd );
                directionalLight.position.set( 0, 0, 1 ).normalize();
                scene.add( directionalLight );

                var loader = new THREE.OBJLoader();
        //loader.load( "img/male02.obj", function ( object ) {
        loader.load( "img/originalMeanModel.obj", function ( object ) {
                    object.position.y = - 80;
                    scene.add( object );
                } );

                // RENDERER
                renderer = new THREE.WebGLRenderer();
                renderer.setSize( window.innerWidth, window.innerHeight );
                container.appendChild( renderer.domElement );

                document.addEventListener( 'mousemove', onDocumentMouseMove, false );

            }

            function onDocumentMouseMove( event ) {

                mouseX = ( event.clientX - windowHalfX ) / 2;
                mouseY = ( event.clientY - windowHalfY ) / 2;

            }

            //

            function animate() {

                requestAnimationFrame( animate );
                render();

            }

            function render() {

                camera.position.x += ( mouseX - camera.position.x ) * .05;
                camera.position.y += ( - mouseY - camera.position.y ) * .05;

                camera.lookAt( scene.position );

                renderer.render( scene, camera );

            }

        </script>

    </body>
</html>

   
    
</asp:Content>
