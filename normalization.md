# Normalization Reasoning

### 1. Examples of Redundant Data
- **Student Information**: Storing `student_name` and `batch` inside the `submissions` table causes repetition for every submission.
- **Course Details**: Repeating `course_name` and `credits` in the `attendance` table for every entry.
- **Contest Data**: Storing `contest_start_time` inside the `submissions` table, which repeats for every student's attempt.

### 2. Design Improvements (Separation)
- **Student Profile**: By creating a `students` table, we ensure that a student's profile (name, batch) exists only once.
- **Problem Metadata**: Moving `test_cases` to a separate table prevents adding test case info every time a problem is defined.

### 3. Functional Dependencies
- **Partial Dependency**: In `enrollments` table, if `grade` depends on `student_id` and `course_id`, we ensure it is fully dependent on the primary key.
- **Transitive Dependency**: If `student_id` determines `batch_id`, and `batch_id` determines `mentor_name`, we move `mentor_name` to the `batches` table to satisfy 3NF.

*Design Note: The final schema is normalized to 3NF to eliminate anomalies.*
