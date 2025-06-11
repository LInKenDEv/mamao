// In-memory store
let scripts = [];

export default function handler(req, res) {
  if (req.method === "POST") {
    const { Action } = req.body;

    if (!Action) {
      return res.status(400).json({ error: "Missing 'Action' field." });
    }

    const id = scripts.length.toString();
    const entry = { id, ...req.body };

    scripts.push(entry);
    return res.status(201).json({ message: "Instruction added", id });
  }

  if (req.method === "GET") {
    if (scripts.length === 0) {
      return res.status(404).json({ error: "No instructions found." });
    }

    // Return all scripts, or allow query ?id=crate001 in future
    return res.status(200).json(scripts);
  }

  res.status(405).json({ error: "Method not allowed." });
}
