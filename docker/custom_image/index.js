const express = require('express');
// environment variable
const app = express();

const ENV = process.env.ENV || 'Unable to read ENV';

app.get('/', (req, res) => {
    const date = new Date();
    console.log(date);
    res.json({ message: 'Hello, World!' , mode: ENV });
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});