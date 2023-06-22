const mongoose = require("mongoose");
const express = require("express");
const dotenv = require("dotenv");
const customErrorHandler = require("./middlewares/errors/customErrorHandler");
const path = require("path");
const connectDatabase = require("./helpers/database/connectDatabase");
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');

const routes = require("./routes/indexRoute.js");

dotenv.config({
    path: "./config/.env"
});

connectDatabase();

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

app.use(express.json());

const PORT = process.env.PORT;

app.use("/api", routes);

app.use(customErrorHandler);

// Static Files (Bu yorum satırını kaldırmazsanız, public klasöründeki dosyalara erişemezsiniz)
app.use(express.static(path.join(__dirname, "public")));

io.on('connection', (socket) => {
    console.log(socket.id);

    socket.on('chat', data => {
        io.sockets.emit('chat', data);
    });

    socket.on("typing", data => {
        socket.broadcast.emit("typing", data);
    });
});

app.use(cors());

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
