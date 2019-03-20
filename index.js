
const port = 3000; // we will use this later

const express = require('express');
const app = express();
const pgp = require('pg-promise')({})
const db = pgp('postgres://localhost/shopped')


app.get('/', (req, res) => {
  res.send('Hello World!')
});

app.post('/', (req, res) => {
    db.none('INSERT INTO users (userName,name,email) VALUES (vanny,van,van@pursuit.org)')
  res.send('Got a POST request')
});

app.put('/user', (req, res) => {
  res.send('Got a PUT request at /user')
});

app.delete('/user', (req, res) => {
  res.send('Got a DELETE request at /user')
});



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})




