<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Validación de Acceso</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #f4f6f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .container {
      background: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 350px;
      position: relative;
    }
    .container img.logo {
      position: absolute;
      top: 10px;
      right: 10px;
      width: 90px;
      opacity: 75;
    }
    input[type="password"] {
      padding: 12px;
      width: 220px;
      border-radius: 6px;
      border: 1px solid #ccc;
      margin-bottom: 10px;
    }
    button {
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      background: #0078d4;
      color: white;
      font-weight: bold;
      cursor: pointer;
    }
    .error {
      color: red;
      margin-top: 10px;
      display: none;
    }
    .success {
      color: green;
      margin-top: 10px;
      display: none;
    }
  </style>
</head>
<body>
  <div class="container">
    <img src="Logo MBT Plus.png" alt="Mainbit Logo" class="logo">
    <h2>Bienvenido</h2>
    <p>Ingresa tu clave de acceso:</p>
    <input type="password" id="claveInput" placeholder="Clave de acceso" />
    <br />
    <button onclick="validarClave()">Validar clave</button>
    <p id="mensajeError" class="error">Error en la validación.</p>
    <p id="mensajeSuccess" class="success">Validando clave...</p>
  </div>

  <script>
    function validarClave() {
      const clave = document.getElementById("claveInput").value;
      const errorMsg = document.getElementById("mensajeError");
      const successMsg = document.getElementById("mensajeSuccess");

      errorMsg.style.display = "none";
      successMsg.style.display = "block";
      successMsg.innerText = "Validando clave...";

      fetch("https://prod-164.westus.logic.azure.com:443/workflows/a27fd494810246e386fc1ada6290a714/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=oDu_69hXEtwQzWM5GoqDAmg0Vz6EL3WpVSYih7C_zUQ", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ clave: clave })
      })
      .then(res => res.json())
      .then(data => {
        if (data.resultado === "valido") {
          successMsg.innerText = data.mensaje || "Acceso concedido. Redirigiendo...";
          setTimeout(() => {
            window.location.href = "https://forms.office.com/r/5SK4TVNmTu";
          }, 1500);
        } else {
          successMsg.style.display = "none";
          errorMsg.innerText = data.mensaje || "Clave incorrecta o no activa.";
          errorMsg.style.display = "block";
        }
      })
      .catch(err => {
        successMsg.style.display = "none";
        errorMsg.innerText = "Error en la conexión. Intenta más tarde.";
        errorMsg.style.display = "block";
        console.error("Error en fetch:", err);
      });
    }
  </script>
</body>
</html>
