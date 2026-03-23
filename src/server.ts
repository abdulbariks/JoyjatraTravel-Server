import express from 'express';
const app = express();
const PORT = 5000;

app.get('/', (req, res) => res.send('JoyjatraTravel API is Running!'));

app.listen(PORT, () => {
  console.log(`🚀 Server ready at http://localhost:${PORT}`);
});