let express = require('express');
let router = express.Router();

router.get('/:product_id', (req, res) => {
  res.send('Sending specific reviews of a product!')
});

router.post('/:product_id', (req, res) => {
  res.send('Creating new review on a product!')
});

module.exports = router;