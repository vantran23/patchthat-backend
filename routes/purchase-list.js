let express = require('express');
let router = express.Router();

router.get('/orders/:user_id', (req, res) => {
  res.send('Sending specific users orders!')
});

module.exports = router;