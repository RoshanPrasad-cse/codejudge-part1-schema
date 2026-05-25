--Normalization--

To ensure data integrity and reduce redundancy, the schema adheres to these normalization rules:

1. First Normal Form (1NF):
All tables have a primary key. Each column contains only single, atomic values. There are no repeating groups or arrays.

2. Second Normal Form (2NF):
The database is in 1NF. Every non-key column depends on the entire primary key, not just a part of it. For example, in the enrollments table, the grade depends on both the student and the course.

3. Third Normal Form (3NF):
The database is in 2NF. There are no transitive dependencies. Non-key columns do not depend on other non-key columns. Student details are kept in the students table, so we don't repeat them elsewhere.
