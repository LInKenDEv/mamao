import { readFileSync } from "fs";
import { join } from "path";

export default function handler(req, res) {
  const ua = req.headers['user-agent'] || "";
  const accept = req.headers['accept'] || "";
  const referer = req.headers['referer'] || "";
  const origin = req.headers['origin'] || "";

  const isRoblox = ua.includes("Roblox") && accept.includes("*/*");
  const isFromWeb = referer || origin;

  if (!isRoblox || isFromWeb) {
    res.setHeader("Content-Type", "text/plain");
    return res.send(`warn("Access Denied: You are not authorized to use this script.")`);
  }

  const filePath = join(process.cwd(), 'roblox', 'lua', 'Tabs.lua');

  try {
    const code = readFileSync(filePath, 'utf-8');
    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(code);
  } catch (err) {
    res.status(500).send("Script loading failed.");
  }
}
