const express = require("express");
const dotenv = require("dotenv");
const app = express();

dotenv.config();

let checkingAccount = {
  name: "Aaron Lee",
  id: "1",
  accountType: "checking",
  balance: 200,
};

let savingAccount = {
  name: "Aaron Lee",
  id: "2",
  accountType: "saving",
  balance: 1000,
};

let accounts = [checkingAccount, savingAccount];

app.get("/api/accounts", (req, res) => {
  res.json(accounts);
});

const listener = app.listen(process.env.PORT, () => {
  console.log("Running Server on: " + listener.address().port);
});
