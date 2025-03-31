const express = require("express");
const os = require("os");
const { networkInterfaces } = require("os");

const app = express();
const PORT = process.env.API_PORT;
const version = process.env.APP_VERSION;

const getIP = () => {
  const nets = networkInterfaces();
  for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
      if (net.family === "IPv4" && !net.internal) {
        return net.address;
      }
    }
  }
  return "Undefine";
};

app.get("/", (req, res) => {
    const hostname = os.hostname();
    const ip = getIP();
    res.send(`
<h1>Server Info</h1>
<p>Hostname: ${hostname}</p>
<p>IP: ${ip}</p>
<p>App version: ${version}</p>
`
    );
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
});
