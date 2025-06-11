export default function handler(req, res) {
  res.status(200).json({
    SendTo: "Workspace",
    Action: "CreatePart",
    Properties: {
      Anchored: true,
      Size: [4, 1, 4],
      Position: [0, 5, 0],
      BrickColor: "Bright red"
    }
  });
}
