$(document).ready(function() {
      var items;
      const stored = localStorage.getItem('items');
      if (stored) {
        items = JSON.parse(stored);
      } else {
        items = [];
      }
      let qty = 0;
      items.forEach((e)=>{
        qty += e.qty;
      });
      $(".cart-number").empty();
      $(".cart-number").append(qty);
      // $("#openbtn").click(() => {
      //   document.getElementById("mySidenav").style.width = "250px";
      //   });
      // $("#closebtn").click(() => {
      //   /* Set the width of the side navigation to 0 */
      //   document.getElementById("mySidenav").style.width = "0";
      //   });
      //
      //   function openNav() {
      //     document.getElementById("mySidenav").style.width = "250px";
      //   }
      //
      //   /* Set the width of the side navigation to 0 */
      //   function closeNav() {
      //     document.getElementById("mySidenav").style.width = "0";
      //   }

        let newLocal = new THREE.Scene();
        let scene = newLocal;

        let camera = new THREE.OrthographicCamera();

        let renderer = new THREE.WebGLRenderer({
          alpha: true
        }); renderer.setClearColor(0x000000, 0); // the default
        renderer.setSize(100, 100); document.body.appendChild(renderer.domElement);

        let geometry = new THREE.ConeGeometry(1.35, 2, 4);
        let material = new THREE.MeshBasicMaterial({
          color: 0x00000000,
          wireframe: true
        });
        let cone = new THREE.Mesh(geometry, material); scene.add(cone);

        let geometry1 = new THREE.SphereGeometry(0.2, 7, 4);
        let material1 = new THREE.MeshBasicMaterial({
          color: 0x00000000,
          wireframe: true
        });
        let sphere = new THREE.Mesh(geometry1, material1); scene.add(sphere);

        sphere.translateY(-0.7);


        cone.scale.x = 0.6; // SCALE
        cone.scale.y = 0.6; // SCALE
        cone.scale.z = 0.6; // SCALE
        sphere.scale.x = 0.5; // SCALE
        sphere.scale.y = 0.5; // SCALE
        sphere.scale.z = 0.5; // SCALE

        sphere.translateY(0.5); cone.translateY(0); sphere.translateX(-0.15); cone.translateX(-0.15); camera.position.z = 5;

        const animate = function() {
          requestAnimationFrame(animate);


          cone.rotation.y += 0.008;
          sphere.rotation.y += 0.008;
          sphere.rotation.x += 0.008;

          renderer.render(scene, camera);
        };

        animate();
      });
