const express = require("express");
const router = express.Router();

const all = async (req, res) => {
  const partidos = await model.get();
  res.json(partidos);
};
const create = async (req, res) => {
  console.log(req.body);
  const { insertId } = await model.insert(req.body);
  res.json(insertId);
};

router.post("/create", create);
router.get("/all", all);

module.exports = router;
