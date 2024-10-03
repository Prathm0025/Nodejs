const express = require('express');
const router = express.Router();

// Example route
router.get('/blogs', (req, res) => {
    res.send('Blog list');
});

module.exports = router;

