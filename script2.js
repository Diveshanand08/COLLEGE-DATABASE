const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();

// MySQL connection setup
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'divesh199@',
    database: 'DTUDB'
});

connection.connect((err) => {
    if (err) throw err;
    console.log('✅ Connected to MySQL database');
});

// Route to serve searchFilter.html directly from current directory
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'searchFilter.html'));
});

// Search route
app.get('/search', (req, res) => {
    const {
        degree_id,
        degree_name,
        hod_id,
        hod_name,
        student_id,
        student_name,
        year
    } = req.query;

    let sql = `
        SELECT s.student_id, s.student_name, s.year, s.age, s.address,
               d.degree_id, d.degree_name, d.degree_duration,
               h.hod_id, h.hod_name,
               dept.department_id, dept.department_name
        FROM student s
        JOIN degree d ON s.degree_id = d.degree_id
        JOIN hod h ON d.hod_id = h.hod_id
        JOIN department dept ON d.department_id = dept.department_id
        WHERE 1=1
    `;

    const params = [];

    if (degree_id) {
        sql += ' AND d.degree_id = ?';
        params.push(degree_id);
    }

    if (degree_name) {
        sql += ' AND d.degree_name LIKE ?';
        params.push(`%${degree_name}%`);
    }

    if (hod_id) {
        sql += ' AND h.hod_id = ?';
        params.push(hod_id);
    }

    if (hod_name) {
        sql += ' AND h.hod_name LIKE ?';
        params.push(`%${hod_name}%`);
    }

    if (student_id) {
        sql += ' AND s.student_id = ?';
        params.push(student_id);
    }

    if (student_name) {
        sql += ' AND s.student_name LIKE ?';
        params.push(`%${student_name}%`);
    }

    if (year) {
        sql += ' AND s.year = ?';
        params.push(year);
    }

    connection.query(sql, params, (err, results) => {
        if (err) {
            console.error('SQL Error:', err);
            return res.status(500).json({ error: 'Database query failed' });
        }
        res.json(results);
    });
});

// Start server
app.listen(4000, () => {
    console.log('🚀 Server started on port 4000');
});
