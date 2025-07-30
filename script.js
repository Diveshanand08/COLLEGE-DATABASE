const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'divesh199@',
  database: 'DTUDB'
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database: ' + err.stack);
    return;
  }
  console.log('Connected to MySQL database with connection ID ' + db.threadId);
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'addStudent.html'));
});

app.post('/submit', (req, res) => {
  const student_id = req.body.student_id;
  const student_name = req.body.student_name;
  const year = req.body.year;
  const age = req.body.age;
  const address = req.body.address;
  const department_id = req.body.department_id;

  const sql = 'INSERT INTO student (student_id, department_id, student_name, year, age, address) VALUES (?, ?, ?, ?, ?, ?)';
  const values = [student_id, department_id, student_name, year, age, address];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error inserting data into MySQL database: ' + err.stack);
      res.status(500).send('Error inserting data into MySQL database');
      return;
    }
    console.log('Data inserted into MySQL database with ID ' + result.insertId);
    res.send('Student data inserted successfully');
  });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
