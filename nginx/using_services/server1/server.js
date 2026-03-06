const express = require('express');
const app = express();

const server_name = 'SERVER_1';

app.get('/', (req, res) => {
    res.json({
        message: 'Hello World! ' + server_name, 
    });
});

app.listen(9001, () => {
    console.log('Server is running on port 9001');
});