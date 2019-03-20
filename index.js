const express = require('express') // import express
const app = express() // create an express server
const port = 8000; // we will use this later

app.get('/', (req, res) => {
  res.send('Hello World!')
}) // routes the '/' URL path to produce a response of 'Hello World!'

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

