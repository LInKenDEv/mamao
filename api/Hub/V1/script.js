const { readFileSync } = require("fs");
const { join } = require("path");

module.exports = function handler(req, res) {
  const ua = req.headers["user-agent"] || "";
  const accept = req.headers["accept"] || "";
  const referer = req.headers["referer"] || "";
  const origin = req.headers["origin"] || "";

  const isRoblox = ua.includes("Roblox") && accept.includes("*/*");
  const isFromWeb = referer || origin;

  if (!isRoblox || isFromWeb) {
    res.setHeader("Content-Type", "text/plain");
    return res.send(`warn("Access Denied: You are not authorized to use this script.")`);
  }

  const match = req.url.match(/=([a-zA-Z0-9_-]+)$/);
  if (!match) {
    res.setHeader("Content-Type", "text/plain");
    return res.status(400).send(`warn("Bad Request: No script name provided.")`);
  }

  const scriptName = match[1];
  const filePath = join(process.cwd(), "roblox", "lua", "scripthub", `${scriptName}.lua`);

  try {
    const code = readFileSync(filePath, "utf-8");
    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(code);
  } catch (err) {
    res.setHeader("Content-Type", "text/plain");
    res.status(404).send(`warn("Script not found: ${scriptName}")`);
  }
};
