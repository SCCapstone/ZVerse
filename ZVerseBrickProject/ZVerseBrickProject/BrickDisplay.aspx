<%@ Page Title="BrickDisplay" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrickDisplay.aspx.cs" Inherits="ZVerseBrickProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <!-- <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
       -->

<html>
   <head>
      <title>3D Rendering</title>
      <style>canvas { width: 50%; height: 50% }</style>
   </head>
      <script src="http://threejs.org/build/three.min.js"></script>
</html>
    
    <!--

<script>

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth/2, window.innerHeight/2);
    document.body.appendChild(renderer.domElement);
    var geometry = new THREE.BoxGeometry(700, 700, 700, 10, 10, 10);
    var material = new THREE.MeshBasicMaterial({ color: 0xfffff, wireframe: true });
    var cube = new THREE.Mesh(geometry, material);
    scene.add(cube);
    camera.position.z = 1000;
    function render() {
        requestAnimationFrame(render);
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;
        renderer.render(scene, camera);
    };
    render();

    </script>
        -->

            <script>

    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
    var renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth/2, window.innerHeight);
    document.body.appendChild(renderer.domElement);
    var geometry = new THREE.BoxGeometry(700, 700, 700, 10, 10, 10);
    var material = new THREE.MeshBasicMaterial({ color: 0xfffff, wireframe: true });
    var cube = new THREE.Mesh(geometry, material);
    scene.add(cube);
    camera.position.z = 1000;
    function render() {
        requestAnimationFrame(render);
        cube.rotation.x += 0.01;
        cube.rotation.y += 0.01;
        renderer.render(scene, camera);
    };
    render();

    </script>

        
            <h2 style="text-align:right">
               Mizzou Tradition Plaza Paved Replica</h2>
            <p style="text-align:right">
                Pleased to offer our alumni an opportunity to take a piece of traditions plaza back home
                </p>
            <p style="text-align:right">
                $75.00
            </p>
            
      
    </asp:Content>
