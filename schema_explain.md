# Database Schema Explanation - CodeJudge System

This document outlines what each table represents and the functional meaning of the core components in the CodeJudge platform dataset.

## Table Overviews

1. **batches**: Represents student groupings based on engineering programs and enrollment timelines. It manages the lifecycle and active status of distinct cohorts.
2. **courses**: Holds the list of academic subjects or development modules offered on the platform, tracking credit allocations.
3. **students**: The master repository for individual student profiles, linked directly to their respective academic batch.
4. **enrollments**: A bridge table tracking which student has registered for which course, tracking their operational status and final performance grades.
5. **sessions**: Logs daily or structured learning sessions allocated dynamically within a course timeline.
6. **attendance**: Captures presence/absence records for students across scheduled course sessions with localized timestamps.
7. **problems**: Contains the technical assignments and programming questions hosted on the system for specific courses.
8. **test_cases**: Stores the hidden or public assessment inputs and expected outputs linked to problems for evaluation.
9. **contests**: Manages timed coding challenges or test events happening inside a specific course context.
10. **contest_problems**: A specialized mapping layer defining which coding questions belong to which contest event and their display order.
11. **submissions**: Captures individual code compilation records uploaded by students, evaluating runtime performance and total scores.
12. **test_results**: Breaks down execution metrics for a student submission across every specific test case configured.
13. **regrade_requests**: Acts as an escalation mechanism for students to challenge grading results or automated evaluation errors.
14. **plagiarism_flags**: A highly critical self-referential table designed to flag overlapping code submissions to detect academic dishonesty.
15. **operation_requests**: An administrative audit logs table designed to safely track modification requests on critical system entities.
16. **raw_student_import**: A staging table used as a raw data buffer area for incoming bulk files prior to clean relational insertion.
