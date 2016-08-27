SELECT
    q.*,
    row_to_json(top) AS topic,
    tags_for_question(q.id) AS tags,
    assessments_for_question(q.id, $2) AS assessments
FROM questions as q
JOIN topics as top ON (top.id = q.topic_id)
AND q.id = $1
AND q.deleted_at IS NULL;
