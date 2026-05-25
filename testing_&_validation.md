# Testing and Validation Report

### 1. Test Cases Executed
- **Constraint Testing**: Verified that `student_id` is unique and `batch_id` acts as a valid foreign key by attempting to insert invalid IDs.
- **Relationship Integrity**: Confirmed that `submissions` cannot be created without a valid `student_id` and `problem_id`.
- **Normalization Verification**: Tested by ensuring non-atomic values (like lists) are not accepted in columns, maintaining 1NF.

### 2. Sample Query Validation
- **Query**: Retrieved all submissions for a specific course.
- **Expected Result**: Should return all records linked to the `course_id`.
- **Actual Result**: Verified the join between `submissions` and `problems` tables works as expected.

### 3. Transactional Integrity (Part 4 Integration)
- Verified that a grade update in the `enrollments` table successfully commits only if all conditions are met, ensuring no partial updates occur.
