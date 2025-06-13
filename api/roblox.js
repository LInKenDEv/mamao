import { readFileSync } from "fs";
import { join } from "path";

export default function handler(req, res) {
  const ua = req.headers['user-agent'] || "";
  const accept = req.headers['accept'] || "";
  const referer = req.headers['referer'] || "";
  const origin = req.headers['origin'] || "";
  const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress;

  // ✅ Real Roblox clients only
  const looksLikeRoblox = ua.includes("Roblox") && accept.includes("*/*");

  // ❌ Reject anything with a referer or origin header (browsers, bots, Discord, etc.)
  const isFromWeb = referer || origin;

  if (!looksLikeRoblox || isFromWeb) {
    // 🛡️ Send fake script to fool snoopers
    res.setHeader("Content-Type", "text/plain");
    return res.send(`warn("Access Denied: You are not authorized to use this script.")`);
  }

  // ✅ Serve the actual Lua script
  const filePath = join(process.cwd(), 'roblox', 'lua', 'loader.lua');

  try {
    const luaCode = readFileSync(filePath, 'utf-8');
    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(luaCode);
  } catch (err) {
    res.status(500).send("Script loading failed.");
  }
}
