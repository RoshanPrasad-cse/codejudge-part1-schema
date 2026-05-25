# Database Design Assumptions - CodeJudge

During the design and schema formulation for the CodeJudge database, the following domain-specific assumptions were made:

1. **String Identifiers**: All ID fields (e.g., `student_id`, `course_id`, `submission_id`) are kept as `TEXT` instead of auto-incrementing integers to ensure compatibility with external UUIDs or alphanumeric codes provided in raw CSV imports.
2. **Nullable Contest Context**: The `contest_id` column in the `submissions` table is explicitly allowed to be `NULL`. This accommodates practice submissions made by students outside of any specific test or contest.
3. **Soft Delete / Flags**: Active status indicator values like `is_active` in the `problems` table use integer representation (`1` for active, `0` for inactive) to mimic strict standard Boolean controls efficiently.
4. **Independent Staging**: The `raw_student_import` table is completely decoupled from foreign key constraints. This acts as a landing zone to clean messy bulk-uploaded data safely before pushing it to the core transactional tables.
5. **Audit Independence**: Admin operation logs (`operation_requests`) act as an isolated audit trail, ensuring that tracking meta-requests does not loop back into core transactional constraints.
