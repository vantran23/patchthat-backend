let express = require('express');
let router = express.Router();

// Instead of setting our request methods on app, we are setting it on our router
router.get('/', (req, res) => {
  res.send('Sending list of all products!')
});

// Notice how we aren't writing /product/:product_id
// This is because we are nesting and in app.js we will already have the first part
router.get('/:product_id', (req, res) => {
  res.send('Sending specific product!')
});


// Export the router like any other NodeJS module
module.exports = router;