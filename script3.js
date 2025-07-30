const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();

// Set up MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'divesh199@',
  database: 'DTUDB'
});

// Connect to MySQL
connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL');
});

// Middleware to parse form data
app.use(express.urlencoded({ extended: true }));

// Serve hod.html page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'hod.html'));  // ✅ make sure this matches your file name
});

// Route for handling form submissions for HOD
app.post('/', (req, res) => {
  const { hod_id, hod_name, department_id, action } = req.body;

  if (action === 'add') {
    // Insert HOD into the HOD table
    const sql = `INSERT INTO HOD (hod_id, hod_name, department_id) 
                 VALUES (?, ?, ?)`;
    connection.query(sql, [hod_id, hod_name, department_id], (err, result) => {
      if (err) {
        console.error(err);
        return res.send('Error adding HOD.');
      }
      console.log('New HOD added to the database');
      res.redirect('/');
    });
  } else if (action === 'delete') {
    // Check number of HODs
    connection.query('SELECT COUNT(*) AS count FROM HOD', (err, results) => {
      if (err) {
        console.error(err);
        return res.send('Error checking HOD count.');
      }

      const count = results[0].count;
      if (count < 2) {
        console.log('Cannot delete HOD. At least one HOD must remain.');
        res.send('Cannot delete HOD. At least one must remain.');
      } else {
        const deleteSql = `DELETE FROM HOD WHERE hod_id = ?`;
        connection.query(deleteSql, [hod_id], (err, result) => {
          if (err) {
            console.error(err);
            return res.send('Error deleting HOD.');
          }
          console.log(`HOD ${hod_id} deleted from the database`);
          res.redirect('/');
        });
      }
    });
  }
});

// Start the server
app.listen(5000, () => {
  console.log('Server started on port 5000');
});
