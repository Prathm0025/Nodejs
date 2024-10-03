const mongoose = require("mongoose");


mongoose.connect("mongodb://root:12345678@mongodb:27017/mydatabase", {
    useNewUrlParser: true,
    useUnifiedTopology: true
})
.then(async () => {
    console.log("Connection established...!");
})

.catch((error) => {
    console.error("Connection error:", error);
});

