# Database Keys and Relationships

Primary Keys:
Every table uses a unique ID column (e.g., student_id, batch_id) as the primary key to ensure each record is unique.

Foreign Keys:
- The students table uses batch_id to link students to their respective batches.
- The enrollments table uses both student_id and course_id to connect students to courses.
- The attendance table uses session_id and student_id to track attendance for specific sessions.
- The problems and contests tables are linked to courses using course_id.
- The submissions table uses student_id, problem_id, and contest_id to track submissions.
- The plagiarism_flags table uses submission_id and matched_submission_id to compare submissions.
