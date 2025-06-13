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

  const base = join(process.cwd(), "roblox", "lua");
  const filesInOrder = [
    "window.lua",
    "tabs.lua",
    "sections.lua",
    "dividers.lua",
    "toggles.lua",
    "visibility.lua"
  ];

  try {
    const combinedLua = filesInOrder
      .map(file => readFileSync(join(base, file), "utf8"))
      .join("\n");

    res.setHeader("Content-Type", "text/plain");
    res.status(200).send(combinedLua);
  } catch (err) {
    res.status(500).send("-- Script loading failed.");
  }
}
