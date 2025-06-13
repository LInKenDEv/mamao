import { readFileSync } from "fs";
import { join } from "path";

export default function handler(req, res) {
  const userAgent = req.headers['user-agent'] || "";

  // Optional: Block non-Roblox requests
  if (!userAgent.includes("Roblox")) {
    return res.status(403).send("Access Denied");
  }

  // Path to the Lua script
  const filePath = join(process.cwd(), 'roblox', 'lua', 'loader.lua');

  try {
    const luaCode = readFileSync(filePath, 'utf-8');

    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(luaCode);
  } catch (err) {
    res.status(500).send("Script loading failed.");
  }
}
