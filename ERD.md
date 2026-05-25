Entity Relationship Diagram (ERD) Overview

The database structure is designed to handle relational data efficiently. Below are the key relationships:

1. batches (1:N) students
2. courses (1:N) sessions
3. courses (1:N) problems
4. courses (1:N) contests
5. students (1:N) enrollments
6. students (1:N) attendance
7. students (1:N) submissions
8. sessions (1:N) attendance
9. problems (1:N) test_cases
10. problems (1:N) submissions
11. contests (1:N) contest_problems
12. submissions (1:N) test_results
13. submissions (1:N) regrade_requests
