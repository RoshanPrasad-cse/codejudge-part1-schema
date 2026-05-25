-- CodeJudge Database Schema
-- Part 1: Relational Design, Keys & Normalization

-- Table 1: batches (Independent parent table)
CREATE TABLE IF NOT EXISTS batches (
    batch_id TEXT PRIMARY KEY,
    batch_code TEXT NOT NULL UNIQUE,
    program TEXT,
    start_date DATE,
    end_date DATE,
    batch_status TEXT
);

-- Table 2: courses (Independent parent table)
CREATE TABLE IF NOT EXISTS courses (
    course_id TEXT PRIMARY KEY,
    course_code TEXT NOT NULL,
    course_title TEXT NOT NULL,
    course_status TEXT,
    credit_hours INTEGER
);

-- Table 3: students (Depends on batches)
CREATE TABLE IF NOT EXISTS students (
    student_id TEXT PRIMARY KEY,
    roll_number TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE,
    batch_id TEXT NOT NULL,
    admission_date DATE,
    enrollment_status TEXT,
    graduation_year INTEGER,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

-- Table 4: enrollments (Depends on students and courses)
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id TEXT PRIMARY KEY,
    student_id TEXT NOT NULL,
    course_id TEXT NOT NULL,
    enrolled_on DATE,
    enrollment_status TEXT,
    final_grade TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table 5: sessions (Depends on courses)
CREATE TABLE IF NOT EXISTS sessions (
    session_id TEXT PRIMARY KEY,
    course_id TEXT NOT NULL,
    session_title TEXT,
    session_date DATE,
    session_type TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table 6: attendance (Depends on sessions and students)
CREATE TABLE IF NOT EXISTS attendance (
    attendance_id TEXT PRIMARY KEY,
    session_id TEXT NOT NULL,
    student_id TEXT NOT NULL,
    attendance_status TEXT NOT NULL,
    marked_at DATETIME,
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Table 7: problems (Depends on courses)
CREATE TABLE IF NOT EXISTS problems (
    problem_id TEXT PRIMARY KEY,
    course_id TEXT NOT NULL,
    problem_code TEXT NOT NULL,
    title TEXT NOT NULL,
    difficulty TEXT,
    max_score INTEGER,
    created_at DATE,
    is_active INTEGER,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table 8: test_cases (Depends on problems)
CREATE TABLE IF NOT EXISTS test_cases (
    test_case_id TEXT PRIMARY KEY,
    problem_id TEXT NOT NULL,
    case_no INTEGER,
    input_label TEXT,
    expected_output_label TEXT,
    points INTEGER,
    is_hidden INTEGER,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

-- Table 9: contests (Depends on courses)
CREATE TABLE IF NOT EXISTS contests (
    contest_id TEXT PRIMARY KEY,
    course_id TEXT NOT NULL,
    contest_title TEXT NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    contest_status TEXT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table 10: contest_problems (Composite Primary Key table matching CSV headers)
CREATE TABLE IF NOT EXISTS contest_problems (
    contest_id TEXT NOT NULL,
    problem_id TEXT NOT NULL,
    problem_order INTEGER,
    PRIMARY KEY (contest_id, problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

-- Table 11: submissions (Depends on students, problems, and contests)
CREATE TABLE IF NOT EXISTS submissions (
    submission_id TEXT PRIMARY KEY,
    student_id TEXT NOT NULL,
    problem_id TEXT NOT NULL,
    contest_id TEXT, -- Can be null for practice submissions outside a contest
    language TEXT,
    submitted_at DATETIME,
    status TEXT,
    score INTEGER,
    runtime_ms INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id)
);

-- Table 12: test_results (Depends on submissions and test_cases)
CREATE TABLE IF NOT EXISTS test_results (
    result_id TEXT PRIMARY KEY,
    submission_id TEXT NOT NULL,
    test_case_id TEXT NOT NULL,
    result_status TEXT,
    runtime_ms INTEGER,
    memory_kb INTEGER,
    awarded_points INTEGER,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (test_case_id) REFERENCES test_cases(test_case_id)
);

-- Table 13: regrade_requests (Depends on submissions and students)
CREATE TABLE IF NOT EXISTS regrade_requests (
    request_id TEXT PRIMARY KEY,
    submission_id TEXT NOT NULL,
    student_id TEXT NOT NULL,
    requested_at DATETIME,
    reason TEXT,
    request_status TEXT,
    resolved_at DATETIME,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Table 14: plagiarism_flags (Self-referential to submissions)
CREATE TABLE IF NOT EXISTS plagiarism_flags (
    flag_id TEXT PRIMARY KEY,
    submission_id TEXT NOT NULL,
    matched_submission_id TEXT NOT NULL,
    similarity_score REAL,
    flag_status TEXT,
    created_at DATETIME,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (matched_submission_id) REFERENCES submissions(submission_id)
);

-- Table 15: operation_requests (Admin audit trail table)
CREATE TABLE IF NOT EXISTS operation_requests (
    operation_id TEXT PRIMARY KEY,
    requested_by TEXT,
    operation_type TEXT,
    target_table TEXT,
    target_record_id TEXT,
    requested_at DATETIME,
    reason TEXT,
    approval_status TEXT,
    executed_at DATETIME
);

-- Table 16: raw_student_import (Bulk data landing table)
CREATE TABLE IF NOT EXISTS raw_student_import (
    raw_row_id TEXT PRIMARY KEY,
    roll_number TEXT,
    full_name TEXT,
    email TEXT,
    batch_code TEXT,
    admission_date DATE,
    import_status TEXT,
    import_notes TEXT
);
