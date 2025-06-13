import { readFileSync } from "fs";
import { join } from "path";
import { obfuscate } from "noobfuscator";
import { minify } from "luamin";

export default function handler(req, res) {
  const ua = req.headers['user-agent'] || "";
  const accept = req.headers['accept'] || "";
  const referer = req.headers['referer'] || "";
  const origin = req.headers['origin'] || "";
  const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress;

  // ✅ Only accept real Roblox clients
  const looksLikeRoblox = ua.includes("Roblox") && accept.includes("*/*");
  const isFromWeb = referer || origin;

  if (!looksLikeRoblox || isFromWeb) {
    res.setHeader("Content-Type", "text/plain");
    return res.send(`warn("Access Denied: You are not authorized to use this script.")`);
  }

  // ✅ Read, minify, and obfuscate the Lua script
  const filePath = join(process.cwd(), 'roblox', 'lua', 'loader.lua');

  try {
    const luaCode = readFileSync(filePath, 'utf-8');
    const minified = minify(luaCode);
    const obfuscated = obfuscate(minified); // <-- Turns it unreadable

    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(obfuscated);
  } catch (err) {
    res.status(500).send("Script loading failed.");
  }
}
