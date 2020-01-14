    let newLocal = new THREE.Scene();
		let scene = newLocal;

		let camera = new THREE.OrthographicCamera();

		let renderer = new THREE.WebGLRenderer({
		  alpha: true
		});
		renderer.setClearColor(0x000000, 0); // the default
		renderer.setSize(window.innerWidth, window.innerHeight);
		document.body.appendChild(renderer.domElement);

		let geometry = new THREE.ConeGeometry(0.55, 2, 4);
		let material = new THREE.MeshBasicMaterial({
		  color: 0x00000000,
		  wireframe: true
		});
		let cone = new THREE.Mesh(geometry, material);
		scene.add(cone);

		let geometry1 = new THREE.SphereGeometry(0.2, 7, 5);
		let material1 = new THREE.MeshBasicMaterial({
		  color: 0x00000000,
		  wireframe: true
		});
		let sphere = new THREE.Mesh(geometry1, material1);
		scene.add(sphere);

		sphere.translateY(-0.7);


		cone.scale.x = 0.1; // SCALE
		cone.scale.y = 0.1; // SCALE
		cone.scale.z = 0.1; // SCALE
		sphere.scale.x = 0.1; // SCALE
		sphere.scale.y = 0.1; // SCALE
		sphere.scale.z = 0.1; // SCALE

		sphere.translateY(1.46);
		cone.translateY(0.8);
		sphere.translateX(-0.45);
		cone.translateX(-0.45);
		camera.position.z = 5;

		const animate = function() {
		  requestAnimationFrame(animate);


		  cone.rotation.y += .008;
		  sphere.rotation.y += 0.008;
		  sphere.rotation.x += 0.008;

		  renderer.render(scene, camera);
		};

		animate();
