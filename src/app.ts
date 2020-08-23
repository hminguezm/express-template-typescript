import express from 'express';

const app: express.Application = express();

app.get('/', (req, res) => {
  res.send('Espress server');
});

app.listen(3000, () => {
  console.log('Template app listening on port 3000!');
});
