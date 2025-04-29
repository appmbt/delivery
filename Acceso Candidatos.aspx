<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Bienvenido</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .container {
      background: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
      text-align: center;
    }
    input[type="password"] {
      padding: 10px;
      width: 200px;
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
    button:disabled {
      background: #cccccc;
      cursor: not-allowed;
    }
    .error {
      color: red;
      margin-top: 10px;
      display: none;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Bienvenido</h2>
    <p>Ingresa tu clave para continuar:</p>
    <input type="password" id="claveInput" placeholder="Clave de acceso" />
    <br />
    <button onclick="validarClave()">Validar clave</button>
    <br /><br />
    <button id="btnEnviar" disabled>Enviar código</button>
    <p id="mensajeError" class="error">Clave incorrecta. Intenta de nuevo.</p>
  </div>

  <script>
    const CLAVE_CORRECTA = "Mainbit2024";

    function validarClave() {
      const input = document.getElementById("claveInput").value;
      const error = document.getElementById("mensajeError");
      const btn = document.getElementById("btnEnviar");

      if (input === CLAVE_CORRECTA) {
        btn.disabled = false;
        error.style.display = "none";
      } else {
        error.style.display = "block";
        btn.disabled = true;
      }
    }
  </script>
</body>
</html>
