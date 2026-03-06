const express = require('express');
const app = express();

const server_name = process.env.SERVER_NAME || 'N/A';

// configure static file
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.send('Hello World! ' + server_name);
});


app.get('/home', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

app.listen(9000, () => {
    console.log('Server is running on port 9000');
});