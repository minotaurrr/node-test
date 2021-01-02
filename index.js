require('dotenv').config();
const express = require('express');
const app = express();

app.get('*', (req, res, next) => {
  res.send('테스트중!!!!!!!');
});

const server = app.listen(process.env.PORT);

module.exports = { server };
