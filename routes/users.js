let express = require('express');
let router = express.Router();

router.get('/all', (req, res) => {
  res.send('Sending all users!')
});

router.get('/:user_id', (req, res) => {
  res.send('Sending specific user!')
});

router.post('/register', (req, res) => {
  res.send('Creating new user!')
});

module.exports = router;