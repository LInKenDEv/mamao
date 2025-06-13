import { readFileSync } from "fs";
import { join } from "path";

export default function handler(req, res) {
  const ua = req.headers['user-agent'] || "";
  const accept = req.headers['accept'] || "";
  const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress;

  // Check for Roblox client behavior
  const looksLikeRoblox = ua.includes("Roblox") && accept.includes("*/*");

  if (!looksLikeRoblox) {
    // Optionally send a fake script instead of 403
    return res.send(`warn("Access denied.")`);
  }

  // Serve real script
  const filePath = join(process.cwd(), 'roblox', 'lua', 'loader.lua');

  try {
    const luaCode = readFileSync(filePath, 'utf-8');
    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(luaCode);
  } catch (err) {
    res.status(500).send("Script loading failed.");
  }
}
