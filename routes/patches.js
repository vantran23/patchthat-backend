let express = require('express');
let router = express.Router();


router.get('/', (req, res) => {
  res.send('Sending list of all products!')
});


router.get('/:product_id', (req, res) => {
  res.send('Sending specific product!')
});



module.exports = router;